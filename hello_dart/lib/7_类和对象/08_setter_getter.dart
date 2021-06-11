main(List<String> args) {
  final d = Dog("黄色");
  d.setColor = "黑色";
  print(d.getColor);
}

class Dog {
  String color;

  String get getColor {
    return color;
  }
  set setColor(String color) {
    this.color = color;
  }

  Dog(this.color);
}

