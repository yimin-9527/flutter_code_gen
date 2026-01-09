// lib/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 导入布局和页面组件
import '../layouts/main_layout.dart';
import '../layouts/auth_layout.dart';
import '../layouts/dashboard_layout.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/home_detail_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/profile/edit_profile_screen.dart';
import '../screens/profile/settings_screen.dart';
import '../screens/products/product_list_screen.dart';
import '../screens/products/product_detail_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true, // 开发时启用路由日志
    routes: [
      // ==================== 第一层：根路由 ====================
      // 1. 首页路由（使用MainLayout）
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          // 首页分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: const HomeScreen(),
                ),
              ),
            ],
          ),
        ],
      ),

      // 2. 认证模块（使用AuthLayout）
      ShellRoute(
        builder: (context, state, child) {
          return AuthLayout(child: child);
        },
        routes: [
          // 登录页面
          GoRoute(
            path: '/login',
            name: 'login',
            pageBuilder: (context, state) => const MaterialPage(
              child: LoginScreen(),
            ),
          ),
          // 注册页面
          GoRoute(
            path: '/register',
            name: 'register',
            pageBuilder: (context, state) => const MaterialPage(
              child: RegisterScreen(),
            ),
          ),
        ],
      ),

      // ==================== 第二层：带底部导航的主应用 ====================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardLayout(navigationShell: navigationShell);
        },
        branches: [
          // 首页分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/home',
                pageBuilder: (context, state) => const MaterialPage(
                  child: HomeScreen(),
                ),
                // 第三层：首页内部的子路由
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: 'homeDetail',
                    pageBuilder: (context, state) {
                      final id = state.pathParameters['id'] ?? '0';
                      return MaterialPage(
                        child: HomeDetailScreen(itemId: id),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          // 个人中心分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/profile',
                pageBuilder: (context, state) => const MaterialPage(
                  child: ProfileScreen(),
                ),
                // 第三层：个人中心内部的子路由
                routes: [
                  // 编辑资料
                  GoRoute(
                    path: 'edit',
                    name: 'editProfile',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: EditProfileScreen(),
                    ),
                  ),
                  // 设置
                  GoRoute(
                    path: 'settings',
                    name: 'settings',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: SettingsScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // 产品分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/products',
                pageBuilder: (context, state) => const MaterialPage(
                  child: ProductListScreen(),
                ),
                // 第三层：产品内部的子路由
                routes: [
                  // 产品详情
                  GoRoute(
                    path: ':id',
                    name: 'productDetail',
                    pageBuilder: (context, state) {
                      final id = state.pathParameters['id']!;
                      final category = state.uri.queryParameters['category'];
                      return MaterialPage(
                        child: ProductDetailScreen(
                          productId: id,
                          category: category,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // 添加忘记密码路由
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const RegisterScreen(),
      ),

      // 添加手机号注册路由
      GoRoute(
        path: '/register/phone',
        builder: (context, state) => const RegisterScreen(),
      ),

      // 添加通知设置详情路由
      GoRoute(
        path: '/settings/notifications',
        builder: (context, state) => const RegisterScreen(),
      ),

      // 添加隐私设置路由
      GoRoute(
        path: '/settings/privacy',
        builder: (context, state) => const RegisterScreen(),
      ),

      // 添加安全设置路由
      GoRoute(
        path: '/settings/security',
        builder: (context, state) => const RegisterScreen(),
      ),

      // 添加关于页面路由
      GoRoute(
        path: '/settings/about',
        builder: (context, state) => const RegisterScreen(),
      ),

      // 添加帮助页面路由
      GoRoute(
        path: '/settings/help',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],

    // 路由重定向（权限控制）
    redirect: (context, state) {
      const isAuthenticated = true; // 这里应该是实际的登录状态检查
      final isGoingToAuth = state.uri.toString().startsWith('/login') ||
          state.uri.toString().startsWith('/register');
      final isGoingToApp = state.uri.toString().startsWith('/app');

      // 如果未登录且要访问app路由，重定向到登录页
      if (!isAuthenticated && isGoingToApp) {
        return '/login?redirect=${Uri.encodeComponent(state.uri.toString())}';
      }

      // 如果已登录且要访问认证页，重定向到首页
      if (isAuthenticated && isGoingToAuth) {
        return '/app/home';
      }

      return null;
    },

    // 错误页面
    errorPageBuilder: (context, state) => MaterialPage(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 20),
              Text(
                '页面未找到',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                state.error.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('返回首页'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
