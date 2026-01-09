// lib/main.dart
import 'package:flutter/material.dart';
import 'router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: '多重嵌套路由示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'AliFont',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
