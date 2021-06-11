import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // 应用启动时显示的页面
      home: Scaffold(
        // 用于设计导航栏
        appBar: AppBar(
          title: Text('Coder'),
        ),
        // 页面的内容部分
        body: Center(
          child: Text(
            "hello world",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 36),
          ),
        ),
      ),
    )
  );
}
