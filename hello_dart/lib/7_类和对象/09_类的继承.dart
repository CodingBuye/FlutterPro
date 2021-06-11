class Animal {
  int age;

  Animal(this.age);

  run() {
    print('在奔跑ing');
  }
}

class Person extends Animal {
  String name;

  Person(String name, int age) : name=name, super(age);

  @override
  run() {
    print('$name在奔跑ing');
  }

  @override
  String toString() {
    return 'name=$name, age=$age';
  }
}




