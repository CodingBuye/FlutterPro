// 优先使用自己作用域中的变量，如果没有找到，则一层层向外查找。
var name = 'global';
main(List<String> args) {
  // var name = 'main';
  void foo() {
    // var name = 'foo';
    print(name);
  }

  foo();
}