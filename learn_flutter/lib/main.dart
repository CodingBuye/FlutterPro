import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///
/// StatelessWidget通常是一些没有状态（State，也可以理解成data）需要维护的Widget：
///   1. 它们的数据通常是直接写死（放在Widget中的数据，必须被定义为final)
///   2. 从parent widget中传入的而且一旦传入就不可以修改；
///   3. 从InheritedWidget获取来使用的数据（这个放到后面会讲解）；
// 代码格式
// class MyStatelessWidget extends StatelessWidget {
  /// StatelessWidget包含一个必须重写的方法：build方法；
  /// build方法的解析：
  ///   1. Flutter在拿到我们自己创建的StatelessWidget时，就会执行它的build方法；
  ///   2. 需要在build方法中告诉Flutter，我们的Widget希望渲染什么元素，比如一个Text Widget；
  ///   3. StatelessWidget没办法主动去执行build方法，当我们使用的数据发生改变时，build方法会被重新执行；
  /// build方法什么情况下被执行呢？：
  ///   1、当我们的StatelessWidget第一次被插入到Widget树中时（也就是第一次被创建时）；
  ///   2、当我们的父Widget（parent widget）发生改变时，子Widget会被重新构建；
  ///   3、如果我们的Widget依赖InheritedWidget的一些数据，InheritedWidget数据发生改变时；
//   @override
//   Widget build(BuildContext context) {
//     return <返回我们的Widget要渲染的Widget，比如一个Text Widget>;
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('coder'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
      ),
    );
  }
}
