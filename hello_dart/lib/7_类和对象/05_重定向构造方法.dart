class Person {
  String name;
  int age;

  Person(this.name, this.age);
  Person.fromName(String name) : this(name, 0);
}

