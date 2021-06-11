import 'dart:math';

class Point {
  final num x;
  final num y;
  final num distance;

  // 错误写法
  // Point(this.x, this.y) {
  //   distance = sqrt(x * x + y * y);
  // }

  // 正确的写法
  Point(this.x, this.y) : distance = sqrt(x * x + y * y);
}

main() {
  var x = 3, y = 4;
  var p = Point(x, y);
  print(p.distance);
}
