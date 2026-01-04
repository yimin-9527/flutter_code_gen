import 'package:flutter/material.dart';
import 'package:flutter_code_gen/src/myWidgets/MyChannelIcon.dart';

class MyMainHomeLeftListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        // 让Container填充全屏
        color: Colors.amber,
        child: ListView.separated(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          itemCount: 5,
          itemBuilder: (context, index) => MyChannelIcon(
            label: "测试",
            backgroundColor: Colors.black,
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10),
        ));
  }
}
