/// class 类名 {
///   类型 成员名;
///   返回值类型 方法名(参数列表) {
///     方法体
///   }
/// }

class Person {
  late String name;

  eat() {
    print('$name在吃东西');
  }
}

/// 注意：从Dart2开始，new关键字可以省略。
main(List<String> args) {
  // 1.创建类的对象
  var p = new Person(); // 直接使用Person()也可以创建

  // 2.给对象的属性赋值
  p.name = 'why';

  // 3.调用对象的方法
  p.eat();
}

