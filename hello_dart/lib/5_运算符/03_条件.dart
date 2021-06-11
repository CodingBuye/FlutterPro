/// Dart中包含一直比较特殊的条件运算符：expr1 ?? expr2
/// 1. 如果expr1是null，则返回expr2的结果;
/// 2. 如果expr1不是null，直接使用expr1的结果。
main() {
  var temp = 'why';
  // var temp = null;
  var name = temp ?? 'kobe';
  print(name);
}