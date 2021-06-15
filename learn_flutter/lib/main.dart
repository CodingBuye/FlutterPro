import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

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
        body: MyScrollDirection(),
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

  MyCounterState() {
    print("3.执行MyCounterState的构造方法");
  }

  @override
  void initState() {
    super.initState();
    print("4.执行MyCounterState的init方法");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("5.执行MyCounterState的didChangeDependencies方法");
  }

  @override
  Widget build(BuildContext context) {
    print("6.执行执行MyCounterState的build方法");
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
      ),
    );
  }

  @override
  void didUpdateWidget(MyCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("执行MyCounterState的didUpdateWidget方法");
  }

  @override
  void dispose() {
    super.dispose();
    print("执行MyCounterState的dispose方法");
  }
}

class MyCounterWidget extends StatefulWidget {

  MyCounterWidget() {
    print('1.执行了MyCounterWidget的构造方法');
  }

  @override
  State<StatefulWidget> createState() {
    print("2.执行了MyCounterWidget的createState方法");
    // 将创建的State返回
    return MyCounterState();
  }
}

/// 生命周期
class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('HomeBody build');
    return MyCounterWidget();
  }
}

/// 文本Widget
class MyTextBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Text("FloatingActionButton"),
          onPressed: () {
            print("FloatingActionButton Click");
          },
        ),
        ElevatedButton(
          child: Text("同意协议", style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.orange[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            print("同意协议");
          },
        ),
        TextButton(
          child: Text("TextButton"),
          onPressed: () {
            print("TextButton Click");
          },
        ),
        OutlinedButton(
          child: Text("OutlinedButton"),
          onPressed: () {
            print("OutlinedButton Click");
          },
        )
      ],
    );
  }
}

/// 网络图片Widget
class MyNetImageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.network(
          "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
          alignment: Alignment.topCenter,
          repeat: ImageRepeat.repeatY,
          color: Colors.red,
          colorBlendMode: BlendMode.colorDodge,
        ),
        width: 300,
        height: 400,
        color: Colors.yellow,
      ),
    );
  }
}

/// 本地图片加载
class MyLocalImageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset('images/1.jpeg'),
        width: 300,
        height: 400,
        color: Colors.yellow,
      ),
    );
  }
}

/// 圆角头像
class MyCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
        child: Container(
          alignment: Alignment(0, .5),
          width: 200,
          height: 200,
          child: Text('冰场利威尔'),
        ),
      ),
    );
  }
}
/// ClipOval也可以实现圆角头像，而且通常是在只有头像时使用
class MyClipOval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}


/// 实现圆角图片
class MyClipRRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

/// TextField的样式以及监听
class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldDemo()
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() {
    return _TextFieldDemoState();
  }
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 设置默认值
    textEditingController.text = 'hello world';
    // 监听文本框
    textEditingController.addListener(() {
      print('textEditingController:${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        labelText: 'username',
        hintText: '请输入用户名',
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.lightGreen
      ),
      onChanged: (value) {
        print('onchanged: $value');
      },
      onSubmitted: (value) {
        print('onsubmitted:$value');
      },
    );
  }
}

/// Form表单
class FormDemo extends StatefulWidget {
  @override
  FormDemoState createState() {
    return FormDemoState();
  }
}

class FormDemoState extends State<FormDemo> {

  final registerFormKey = GlobalKey<FormState>();
  String? username, password;

  void registerForm() {
    registerFormKey.currentState!.save();
    print('username: $username password:$password');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: '用户名或手机号'
            ),
            onSaved: (value) {
              this.username = value;
            },
            validator: (value) {
              if(value!.isEmpty) {
                return '账号不能为空';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: '密码'
            ),
            onSaved: (value) {
              this.password = value;
            },
          ),
          SizedBox(height: 16,),
          Container(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
              child: Text('注 册', style: TextStyle(fontSize: 20, color: Colors.white),),
              onPressed: registerForm,
            ),
          )
        ],
      ),
    );
  }
}

/// Align
class MyAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Icon(Icons.pets, size: 36, color: Colors.red,),
      alignment: Alignment.bottomRight,
      widthFactor: 3,
      heightFactor: 3,
    );
  }
}

/// Container
class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromRGBO(3, 3, 255, .5),
        width: 100,
        height: 100,
        child: Icon(Icons.pets, size: 32, color: Colors.white,),
      ),
    );
  }
}


/// Row
class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(color: Colors.red, width: 60, height: 60),
        Container(color: Colors.blue, width: 80, height: 80),
        Container(color: Colors.green, width: 70, height: 70),
        Container(color: Colors.orange, width: 100, height: 100),
      ],
    );
  }
}

/// ListView
class MyListView extends StatelessWidget {
  final TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("人的一切痛苦，本质上都是对自己无能的愤怒。", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("人活在世界上，不可以有偏差；而且多少要费点劲儿，才能把自己保持到理性的轨道上。", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("我活在世上，无非想要明白些道理，遇见些有趣的事。", style: textStyle),
        )
      ],
    );
  }
}

class MyListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.people, size: 36,),
          title: Text('联系人'),
          subtitle: Text('联系人信息'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.email, size: 36,),
          title: Text('邮箱'),
          subtitle: Text('邮箱地址'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.message, size: 36,),
          title: Text('消息'),
          subtitle: Text('消息详情'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.map, size: 36,),
          title: Text('地址'),
          subtitle: Text('地址详情'),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}

class MyScrollDirection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      itemExtent: 200,
      children: [
        Container(color: Colors.red, width: 200,),
        Container(color: Colors.green, width: 200,),
        Container(color: Colors.blue, width: 200,),
        Container(color: Colors.purple, width: 200,),
        Container(color: Colors.orange, width: 200,)
      ],
    );
  }
}
