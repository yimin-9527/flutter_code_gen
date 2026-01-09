// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_code_gen/src/screens/discover_page.dart';
import 'package:flutter_code_gen/src/screens/home_page.dart';
import 'package:flutter_code_gen/src/screens/main_layout.dart';
import 'package:flutter_code_gen/src/screens/profile_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: '底部导航栏示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 路由配置
final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    // 主页面，包含底部导航栏
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // 返回包含底部导航栏的页面
        return MainLayout(navigationShell: navigationShell);
      },
      branches: [
        // 首页分支
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        // 发现分支
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/discover',
              builder: (context, state) => const DiscoverPage(),
            ),
          ],
        ),
        // 我的分支
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
