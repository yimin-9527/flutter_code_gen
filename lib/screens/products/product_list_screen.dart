// lib/screens/products/product_list_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'id': '1', 'name': '产品1', 'category': '电子产品'},
      {'id': '2', 'name': '产品2', 'category': '服装'},
      {'id': '3', 'name': '产品3', 'category': '食品'},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          '产品列表',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ...products.map((product) {
          return Card(
            child: ListTile(
              title: Text(product['name']!),
              subtitle: Text('分类: ${product['category']}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => context.go(
                '/app/products/${product['id']}?category=${product['category']}',
              ),
            ),
          );
        }).toList(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => context.go('/app/home'),
          child: const Text('返回首页'),
        ),
      ],
    );
  }
}
