/// 返回值 函数的名称(参数列表) {
//      函数体
//      return 返回值
/// }

int sum1(int num1, int num2) {
  return num1 + num2;
}

// Effective Dart建议对公共的API, 使用类型注解,
// 但是如果我们省略掉了类型,
// 依然是可以正常工作的
sum2(num1, num2) {
  return num1 + num2;
}

// 如果函数中只有一个表达式, 那么可以使用箭头语法(arrow syntax)
sum3(num1, num2) => num1 + num2;