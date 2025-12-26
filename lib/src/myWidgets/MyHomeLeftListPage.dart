import 'package:flutter/material.dart';

class MyMainHomeLeftListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        // 让Container填充全屏
        color: Colors.amber,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              width: 15, // 设置宽度
              height: 45,
              child: Container(
                width: 15, // 设置宽度
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0), // 设置所有角为20.0的圆角
                ),
                child: Icon(
                  Icons.message,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              child: Text("-----------------"),
            ),
            Container(
                width: 25, // 设置宽度
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0), // 设置所有角为20.0的圆角
                ),
                child: Icon(
                  Icons.touch_app,
                  size: 25,
                )),
            Container(
                width: 25, // 设置宽度
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0), // 设置所有角为20.0的圆角
                ),
                child: Icon(
                  Icons.traffic,
                  size: 25,
                )),
            Container(
                width: 25, // 设置宽度
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0), // 设置所有角为20.0的圆角
                ),
                child: Icon(
                  Icons.title,
                  size: 25,
                )),
            Container(
                width: 25, // 设置宽度
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0), // 设置所有角为20.0的圆角
                ),
                child: Icon(
                  Icons.tty,
                  size: 25,
                )),
          ],
        ));
  }
}
