/// 在开发中, 我们确实希望实现更多的构造方法，怎么办呢？
/// 因为不支持方法（函数）的重载，所以我们没办法创建相同名称的构造方法。

class Person {
  late String name;
  late int age;

  Person() {
    name = '';
    age = 0;
  }
  // 命名构造方法
  Person.withArguments(String name, int age) {
    this.name = name;
    this.age = age;
  }

  Person.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.age = map['age'];
  }

  @override
  String toString() {
    return 'name=$name age=$age';
  }
}

main() {
  // 创建对象
  var p1 = new Person();
  print(p1);
  var p2 = new Person.withArguments('why', 18);
  print(p2);

  var p3 = Person.fromMap({'name': 'kobe', 'age': 30});
  print(p3);
}

