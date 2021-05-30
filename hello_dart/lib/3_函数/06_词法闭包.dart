// 闭包可以访问其词法范围内的变量，即使函数在其他地方被使用，也可以正常的访问
main(List<String> args) {
  makeAdder(num addBy) {
    return (num i) {
      return i + addBy;
    };
  }

  var adder2 = makeAdder(2);
  print(adder2(10)); // 12
  print(adder2(6)); // 8

  var adder5 = makeAdder(5);
  print(adder5(10)); // 15
  print(adder5(6)); // 11
}