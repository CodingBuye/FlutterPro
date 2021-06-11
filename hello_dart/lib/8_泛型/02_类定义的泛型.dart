main(List<String> args) {
  Location l2 = Location<int>(10, 20);
  print(l2.x.runtimeType); // int

  // Location l3 = Location<String>('aaa', 'bbb');
  // print(l3.x.runtimeType); // String
}

// class Location<T> {
//   T x;
//   T y;
//
//   Location(this.x, this.y);
// }

// 如果希望类型只能是num
class Location<T extends num> {
  T x;
  T y;

  Location(this.x, this.y);
}
