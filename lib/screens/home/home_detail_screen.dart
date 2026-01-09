// lib/screens/home/home_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDetailScreen extends StatelessWidget {
  final String itemId;

  const HomeDetailScreen({
    super.key,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页详情 - $itemId'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // 分享操作
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 详情头部
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.description,
                  size: 100,
                  color: Colors.blue[300],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 详情内容
            Text(
              '项目详情 ID: $itemId',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              '创建时间: 2024-01-15',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              '详细描述',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              '这是首页项目的详细描述内容。这里可以展示更详细的信息，包括项目说明、特点、使用方法等。',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            // 标签
            Wrap(
              spacing: 10,
              children: [
                Chip(
                  label: const Text('标签1'),
                  backgroundColor: Colors.blue[100],
                ),
                Chip(
                  label: const Text('标签2'),
                  backgroundColor: Colors.green[100],
                ),
                Chip(
                  label: const Text('标签3'),
                  backgroundColor: Colors.orange[100],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // 操作按钮
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // 编辑操作
                    context.push('/app/home/detail?id=$itemId/edit');
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('编辑'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    // 删除操作
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('确认删除'),
                        content: const Text('确定要删除这个项目吗？'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('取消'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context.pop(); // 返回上一页
                            },
                            child: const Text('删除'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text('删除'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 返回按钮
            Center(
              child: ElevatedButton(
                onPressed: () => context.go('/app/home'),
                child: const Text('返回首页'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
