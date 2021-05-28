/// 变量类型  变量名称 = 赋值；

main(List<String> args) {
  String name = "coderwhy";
  int age = 18;
  double height = 1.88;
  print('${name}, ${age}, ${height}');

  String content = 'hello dart';

  // 定义的变量可以修改值，但是不能赋值其他类型
  content = 'hello world';
  // content = 111;
}