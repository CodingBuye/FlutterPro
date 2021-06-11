/// 在Dart中没有具体实现的方法(没有方法体)，就是抽象方法。
/// 抽象方法，必须存在于抽象类中。
/// 抽象类是使用abstract声明的类。
///
/// 抽象类不能实例化
/// 抽象类中的抽象方法必须被子类实现, 抽象类中的已经被实现方法, 可以不被子类重写.
abstract class Shape {
  getArea();
}

class Circle extends Shape {
  double r;

  Circle(this.r);

  @override
  getArea() {
    return r * r * 3.14;
  }
}

class Rectangle extends Shape {
  double w;
  double h;

  Rectangle(this.w, this.h);

  @override
  getArea() {
    return w * h;
  }
}

