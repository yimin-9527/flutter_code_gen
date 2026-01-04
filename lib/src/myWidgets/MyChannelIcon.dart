import 'package:flutter/material.dart';

class MyChannelIcon extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const MyChannelIcon({
    Key? key,
    required this.label,
    required this.backgroundColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: SizedBox(
      width: 50.0, // 设置宽度
      height: 50.0,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 184, 10, 94),
          borderRadius: BorderRadius.circular(10.0), // 设置所有角为20.0的圆角
        ),
        child: Icon(
          Icons.message,
          size: 40,
          color: Colors.black,
        ),
      ),
    ));
  }
}
