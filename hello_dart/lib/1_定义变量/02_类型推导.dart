import 'dart:io';

/// var/dynamic/const/final 变量名称 = 赋值

class Person {
  const Person();
}

main(List<String> args) {
  // var的使用
  var name = 'coder';
  name = 'kobe';
  print(name.runtimeType); // String 用于获取变量的当前类型
  var age = 18;
  // age = 'why'; // 不可以将String赋值给一个int类型

  // dynamic的使用:通常情况下不使用dynamic, 因为类型的变量会带来潜在的危险
  dynamic name1 = 'coder';
  print(name1.runtimeType); // String
  name1 = 111;
  print(name1.runtimeType); // int

  // final和const都是用于定义常量的, 也就是定义之后值都不可以修改
  final name2 = 'coder';
  // name2 = 'kobe'; // 错误
  const age1 = 18;
  // age1 = 20; // 错误

  // final和const有什么区别呢?
  // const在赋值时, 赋值的内容必须是在编译期间就确定下来的
  // final在赋值时, 可以动态获取, 比如赋值一个函数

  // const name3 = getName(); // 错误的做法, 因为要执行函数才能获取到值
  final name4 = getName(); // 正确的做法

  // const time = DateTime.now(); // 错误的赋值方式
  final time = DateTime.now();
  print(time);
  sleep(Duration(seconds: 2));
  print(time); // final一旦被赋值后就有确定的结果, 不会再次赋值

  // const放在赋值语句的右边，可以共享对象，提高性能:
  final a = const Person();
  final b = const Person();
  print(identical(a, b)); // true

  final m = Person();
  final n = Person();
  print(identical(m, n)); // false
}


String getName() {
  return 'coder';
}