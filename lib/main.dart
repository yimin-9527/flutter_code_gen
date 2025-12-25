import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
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
    return Column(
      children: [Text("内容")],
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
          children: [Text("主页"), Text("通知"), Text("您")],
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
        body: Column(
      children: [
        FractionallySizedBox(heightFactor: 0.8, child: MyMainHomePage()),
        FractionallySizedBox(heightFactor: 0.2, child: MyMenuPage())
      ],
    ));
  }
}
