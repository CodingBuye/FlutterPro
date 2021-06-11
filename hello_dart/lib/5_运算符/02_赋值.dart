/// dart有一个很多语言都不具备的赋值运算符：
/// 1。当变量为null时，使用后面的内容进行赋值。
/// 2。当变量有值时，使用自己原来的值。
main(List<String> args) {
  var name1 = 'coderwhy';
  print(name1);
  // var name2 = 'kobe';
  var name2 = null;
  name2 ??= 'james';
  print(name2); // 当name2初始化为kobe时，结果为kobe，当初始化为null时，赋值了james
}
