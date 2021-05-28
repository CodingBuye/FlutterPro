/// 对于数值来说，我们也不用关心它是否有符号，以及数据的宽度和精度等问题。
/// 只要记着整数用int，浮点数用double就行了。
/// 不过，要说明一下的是Dart中

main(List<String> args) {
  // 整数类型int
  int age = 18;
  int hexAge = 0x12;
  print(age);
  print(hexAge);

  // 浮点类型
  double height = 1.88;
  print(height);

  // 字符串和数字转化
  // 1.字符串转数字
  var one = int.parse('111');
  var two = double.parse('12.22');
  print('${one} ${one.runtimeType}'); // 111 int
  print('${two} ${two.runtimeType}'); // 12.22 double

  // 2.数字转字符串
  var num1 = 123;
  var num2 = 123.456;
  var num1Str = num1.toString();
  var num2Str = num2.toString();
  var num2StrD = num2.toStringAsFixed(2); // 保留两位小数
  print('${num1Str} ${num1Str.runtimeType}'); // 123 String
  print('${num2Str} ${num2Str.runtimeType}'); // 123.456 String
  print('${num2StrD} ${num2StrD.runtimeType}'); // 123.46 String
}