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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(value: true, onChanged: (value) => print("Hello Flutter")),
              Text(
                "同意协议",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        ),
      ),
    )
  );
}
