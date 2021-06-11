main(List<String> args) {
  var p1 = Person('why');
  var p2 = Person('why');
  print(identical(p1, p2)); // true
}

class Person {
  String name;

  static final Map<String, Person> _cache = <String, Person>{};

  factory Person(String name) {
    return _cache.putIfAbsent(name, () => Person._internal(name));
  }

  Person._internal(this.name);
}
