import 'dart:io';

main(List<String> args) {
  print("main function start");
  // 使用变量接收getNetworkData返回的future
  var future = getNetworkData();
  // 当future实例有返回结果时，会自动回调then中传入的函数
  // 该函数会被放入到事件循环中，被执行
  future.then((value) {
    print(value);
  }).catchError((error) { // 捕获出现异常时的情况
    print(error);
  });
  print(future);
  print("main function end");
}

Future<String> getNetworkData() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    // return 'network data';
    throw Exception("网络请求出现错误");
  });
}