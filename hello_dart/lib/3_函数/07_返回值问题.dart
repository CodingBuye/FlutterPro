// 所有函数都返回一个值。如果没有指定返回值，则语句返回null;隐式附加到函数体。
main(List<String> args) {
  print(foo()); // null
}

foo() {
  print('foo function');
}