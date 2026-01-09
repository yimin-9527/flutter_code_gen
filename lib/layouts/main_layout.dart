// lib/layouts/main_layout.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayout({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('主布局'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // 打开抽屉等操作
          },
        ),
      ),
      body: navigationShell,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/app/home/detail?id=123'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
