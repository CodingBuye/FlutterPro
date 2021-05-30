
import 'package:flutter/cupertino.dart';

/// 函数的参数可以分成两类: 必须参数和可选参数
/// 可选参数可以分为 命名可选参数 和 位置可选参数
///     命名可选参数: {param1, param2, ...}
//      位置可选参数: [param1, param2, ...]
//  只有可选参数才可以有默认值, 必须参数不能有默认值

// 命名可选参数
printInfo1(String name, {int age=0, double height=0}) {
  print('name=$name age=$age height=$height');
}

// 定义位置可选参数
printInfo2(String name, [int age=0, double height=0]) {
  print('name=$name age=$age height=$height');
}

// 命名可选参数的必须
printInfo3(String name, {int age=0, double height=0, @required String address=''}) {
  print('name=$name age=$age height=$height address=$address');
}

main(List<String> args) {
  // 调用printInfo1函数
  printInfo1('why'); // name=why age=null height=null
  printInfo1('why', age: 18); // name=why age=18 height=null
  printInfo1('why', age: 18, height: 1.88); // name=why age=18 height=1.88
  printInfo1('why', height: 1.88); // name=why age=null height=1.88

  // 调用printInfo2函数
  printInfo2('why'); // name=why age=null height=null
  printInfo2('why', 18); // name=why age=18 height=null
  printInfo2('why', 18, 1.88); // name=why age=18 height=1.88
}