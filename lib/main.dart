import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_gen/src/myWidgets/MyHomeLeftListPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: ChangeNotifierProvider(
          create: (context) => MyAppState(),
          child: MaterialApp(
            title: '字节互联',
            theme: ThemeData(
              fontFamily: 'AliFont',
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            ),
            home: MyHomePage(),
          ),
        ));
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
