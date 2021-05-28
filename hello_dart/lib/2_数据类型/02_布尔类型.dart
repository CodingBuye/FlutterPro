/// 布尔类型中,Dart提供了一个bool的类型, 取值为true和false
/// 注意: Dart中不能判断非0即真, 或者非空即真
/// Dart的类型安全性意味着您不能使用if(非booleanvalue)
/// 或assert(非booleanvalue)之类的代码。


main(List<String> args) {
  // 布尔类型
  var isFlag = true;
  print('$isFlag ${isFlag.runtimeType}');

  var message = 'Hello Dart';
  // 错误的写法
  // if (message) {
  //   print(message)
  // }
}