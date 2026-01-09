// lib/screens/profile/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  String _language = '中文';
  String _fontSize = '中等';

  final List<String> _languages = ['中文', 'English', '日本語', '한국어'];
  final List<String> _fontSizes = ['小', '中等', '大', '超大'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
          // 用户信息
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '用户名',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'user@example.com',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    context.push('/app/profile/edit');
                  },
                ),
              ],
            ),
          ),

          const Divider(),

          // 通知设置
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('通知'),
            subtitle: const Text('管理应用通知设置'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
              },
            ),
            onTap: () {
              // 可以跳转到更详细的设置页面
              context.push('/settings/notifications');
            },
          ),

          // 主题设置
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('暗黑模式'),
            subtitle: const Text('切换应用主题'),
            trailing: Switch(
              value: _darkMode,
              onChanged: (value) {
                setState(() => _darkMode = value);
              },
            ),
          ),

          // 语言设置
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('语言'),
            subtitle: Text(_language),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            '选择语言',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        ..._languages.map((language) {
                          return RadioListTile<String>(
                            title: Text(language),
                            value: language,
                            groupValue: _language,
                            onChanged: (value) {
                              setState(() => _language = value!);
                              Navigator.pop(context);
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          // 字体大小
          ListTile(
            leading: const Icon(Icons.format_size),
            title: const Text('字体大小'),
            subtitle: Text(_fontSize),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            '选择字体大小',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        ..._fontSizes.map((size) {
                          return RadioListTile<String>(
                            title: Text(size),
                            value: size,
                            groupValue: _fontSize,
                            onChanged: (value) {
                              setState(() => _fontSize = value!);
                              Navigator.pop(context);
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          const Divider(),

          // 隐私设置
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('隐私设置'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              context.push('/settings/privacy');
            },
          ),

          // 账号安全
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('账号安全'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              context.push('/settings/security');
            },
          ),

          // 清除缓存
          ListTile(
            leading: const Icon(Icons.cleaning_services),
            title: const Text('清除缓存'),
            subtitle: const Text('128.5 MB'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('清除缓存'),
                  content: const Text('确定要清除缓存数据吗？'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('取消'),
                    ),
                    TextButton(
                      onPressed: () {
                        // 清除缓存逻辑
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('缓存已清除'),
                          ),
                        );
                      },
                      child: const Text('确定'),
                    ),
                  ],
                ),
              );
            },
          ),

          const Divider(),

          // 关于我们
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('关于我们'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              context.push('/settings/about');
            },
          ),

          // 帮助与反馈
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('帮助与反馈'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              context.push('/settings/help');
            },
          ),

          // 检查更新
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('检查更新'),
            subtitle: const Text('当前版本 1.0.0'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('已是最新版本'),
                ),
              );
            },
          ),

          const Divider(),

          // 退出登录
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('退出登录'),
                    content: const Text('确定要退出登录吗？'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('取消'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.go('/login');
                        },
                        child: const Text('确定'),
                      ),
                    ],
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('退出登录'),
            ),
          ),

          // 删除账号
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('删除账号'),
                    content: const Text('确定要删除账号吗？此操作不可恢复。'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('取消'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // 删除账号逻辑
                          context.go('/');
                        },
                        child: const Text('删除'),
                      ),
                    ],
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('删除账号'),
            ),
          ),
        ],
      ),
    );
  }
}
