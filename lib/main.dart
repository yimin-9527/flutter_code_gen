import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_gen/src/myWidgets/MyHomeLeftListPage.dart';
import 'package:flutter_code_gen/src/myWidgets/NotFoundPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_router/url_router.dart';

void main() {
  runApp(
    // 关键：必须在 MaterialApp 之上提供 Provider
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. 创建路由委托
    final UrlRouter router = UrlRouter(
      // 2. 定义路由页面堆栈
      onGeneratePages: (router) => [
        // 首页始终存在
        MaterialPage(child: HomeScreen()),
        // 根据URL动态叠加页面
        if (router.url == '/') ...[
          MaterialPage(child: MyHomePage()),
        ],
        if (router.url == '/profile') ...[
          MaterialPage(child: MyHomePage()),
        ],
      ],
      // 3. 【关键】使用builder定义外层布局，navigator参数就是路由内容区
      builder: (router, navigator) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              // 获取可用高度
              final availableHeight = constraints.maxHeight;

              return Column(
                children: [
                  // 固定高度的顶部
                  Container(
                    height: 50,
                    color: Colors.blue,
                    child: Center(child: Text('顶部')),
                  ),

                  // 动态高度的中间部分（剩余高度的70%）
                  Container(
                    height: availableHeight * 0.9 - 50, // 减去顶部高度
                    color: Colors.green,
                    child: Center(
                      child: // 动态的路由内容区（这就是你的“Router-view”）
                          Expanded(child: navigator),
                    ),
                  ),

                  // 剩余30%的底部
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                      child: Center(child: MyMenuPage()),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );

    // 4. 使用 MaterialApp.router
    return MaterialApp.router(
      routeInformationParser: UrlRouteParser(),
      routerDelegate: router,
      title: '适界/Adaptive Edge',
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // ↓ Add this.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyMainHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          flex: 2, // 30% 宽度 (3/(3+7)=30%)
          child: Container(
            color: const Color.fromARGB(255, 187, 155, 153),
            alignment: Alignment.center,
            child: MyMainHomeLeftListPage(),
          ),
        ),

        // 中间：宽度40%，高度填满
        Expanded(
          flex: 8, // 40% 宽度
          child: Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Text('内容主体', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

class MyMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 239, 35, 96),
        padding: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/主页.svg",
                    height: 30,
                  ),
                  Text("主页")
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/通知.svg",
                    height: 30,
                  ),
                  Text("通知")
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/自己.svg",
                    height: 30,
                  ),
                  Text("您")
                ],
              ),
            ),
          ],
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 获取可用高度
          final availableHeight = constraints.maxHeight;

          return Column(
            children: [
              // 固定高度的顶部
              Container(
                height: 50,
                color: Colors.blue,
                child: Center(child: Text('顶部')),
              ),

              // 动态高度的中间部分（剩余高度的70%）
              Container(
                height: availableHeight * 0.9 - 50, // 减去顶部高度
                color: Colors.green,
                child: Center(child: MyMainHomePage()),
              ),

              // 剩余30%的底部
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: Center(child: MyMenuPage()),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// --- 以下为示例组件 ---
// 固定的侧边栏
class SideBar extends StatelessWidget {
  const SideBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 239, 35, 96),
        padding: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/主页.svg",
                    height: 30,
                  ),
                  Text("主页")
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/通知.svg",
                    height: 30,
                  ),
                  Text("通知")
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/自己.svg",
                    height: 30,
                  ),
                  Text("您")
                ],
              ),
            ),
          ],
        ));
  }
}

// 主页
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Screen'));
  }
}
