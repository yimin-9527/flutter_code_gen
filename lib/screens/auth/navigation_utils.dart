// lib/router/navigation_utils.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationUtils {
  // 获取当前路由信息
  static String getCurrentRoute(BuildContext context) {
    final route = GoRouterState.of(context);
    return route.uri.toString();
  }

  // 判断是否在某个路由下
  static bool isUnderRoute(BuildContext context, String routePath) {
    final current = getCurrentRoute(context);
    return current.startsWith(routePath);
  }

  // 导航到指定路由并携带参数
  static void navigateTo(
    BuildContext context, {
    required String path,
    Map<String, String>? params,
    Map<String, String>? query,
    Object? extra,
  }) {
    String finalPath = path;

    // 替换路径参数
    if (params != null) {
      params.forEach((key, value) {
        finalPath = finalPath.replaceAll(':$key', value);
      });
    }

    // 添加查询参数
    if (query != null && query.isNotEmpty) {
      final queryString = query.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
          .join('&');
      finalPath = '$finalPath?$queryString';
    }

    // 执行导航
    if (extra != null) {
      context.go(finalPath, extra: extra);
    } else {
      context.go(finalPath);
    }
  }

  // 返回上一级
  static void goBack(BuildContext context) {
    context.pop();
  }

  // 替换当前路由
  static void replace(BuildContext context, String path) {
    context.replace(path);
  }
}
