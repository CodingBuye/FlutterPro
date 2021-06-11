/// 1. 普通构造方法
// 当通过类创建一个对象时，会调用这个类的构造方法。
//
// - 当类中没有明确指定构造方法时，将默认拥有一个无参的构造方法。
// - 前面的Person中我们就是在调用这个构造方法.
//
// 也可以根据自己的需求，定义自己的构造方法:
// - 当有了自己的构造方法时，默认的构造方法将会失效，不能使用
// - 当然，你可能希望明确的写一个默认的构造方法，但是会和我们自定义的构造方法冲突；
//   这是因为Dart本身不支持函数的重载（名称相同, 参数不同的方式）。
//   这里我还实现了toString方法

class Person {
  late String name;
  late int age;

  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }
  // 等同于
  Person(this.name, this.age);

  @override
  String toString() {
    return 'name=$name age=$age';
  }
}

