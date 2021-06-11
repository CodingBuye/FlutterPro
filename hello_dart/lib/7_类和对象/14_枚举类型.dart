/// 枚举类型的注意事项:
/// 1。注意一: 您不能子类化、混合或实现枚举。
/// 2。注意二: 不能显式实例化一个枚举
main(List<String> args) {
  print(Colors.red.index);
  print(Colors.green.index);
  print(Colors.blue.index);

  print(Colors.values);
}

enum Colors {
  red,
  green,
  blue
}

