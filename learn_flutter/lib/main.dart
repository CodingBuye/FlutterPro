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
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('coder'),
        ),
        body: MyCounterWidget(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          ProductItem("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          ProductItem("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
          ProductItem("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  ProductItem(this.title, this.description, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 24),),
          Text(description, style: TextStyle(fontSize: 18),),
          SizedBox(height: 10,),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}

/// 计数器案例
/// 创建StatefulWidget时必须创建两个类：
/// 1。一个类继承自StatefulWidget，作为Widget树的一部分；
/// 2。一个类继承自State，用于记录StatefulWidget会变化的状态，并且根据状态的变化，构建出新的Widget；
///
/// 创建一个StatefulWidget，我们通常会按照如下格式来做：
// class MyStatefulWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // 将创建的State返回
//     return MyState();
//   }
// }
//
// class MyState extends State<MyStatefulWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return <构建自己的Widget>;
//   }
// }
/// 当Flutter在构建Widget Tree时，会获取State的实例，
/// 并且它调用build方法去获取StatefulWidget希望构建的Widget；
/// 那么，我们就可以将需要保存的状态保存在MyState中，因为它是可变的；
class MyCounterState extends State<MyCounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("+1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
              ),
              ElevatedButton(
                child: Text("-1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
              )
            ],
          ),
          Text("当前计数：$counter", style: TextStyle(fontSize: 30),)
        ],
      )
    );
  }
}

class MyCounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCounterState();
  }
}
