// lib/screens/products/product_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;
  final String? category;

  const ProductDetailScreen({
    super.key,
    required this.productId,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('产品详情 $productId'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '产品ID: $productId',
              style: const TextStyle(fontSize: 20),
            ),
            if (category != null) ...[
              const SizedBox(height: 10),
              Text('分类: $category'),
            ],
            const SizedBox(height: 20),
            const Text('产品描述...'),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () => context.pop(),
                  child: const Text('返回列表'),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/app/profile'),
                  child: const Text('去个人中心'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
