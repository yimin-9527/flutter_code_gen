// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          '首页',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            title: const Text('首页详情'),
            subtitle: const Text('这是首页的内容'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('/app/home/detail?id=123'),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: ListTile(
            title: const Text('去产品页面'),
            subtitle: const Text('查看产品列表'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('/app/products'),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: ListTile(
            title: const Text('编辑资料'),
            subtitle: const Text('前往个人中心'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('/app/profile/edit'),
          ),
        ),
      ],
    );
  }
}
