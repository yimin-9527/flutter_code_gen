// lib/screens/profile/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, size: 60, color: Colors.white),
        ),
        const SizedBox(height: 20),
        const Text(
          '个人中心',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Card(
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('编辑资料'),
            onTap: () => context.go('/app/profile/edit'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            onTap: () => context.go('/app/profile/settings'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('退出登录'),
            onTap: () => context.go('/login'),
          ),
        ),
      ],
    );
  }
}
