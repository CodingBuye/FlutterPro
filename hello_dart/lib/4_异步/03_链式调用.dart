import "dart:io";

main(List<String> args) {
  print("main function start");

  getNetworkData().then((value1) {
    print(value1);
    return "content data2";
  }).then((value2) {
    print(value2);
    return "message data3";
  }).then((value3) {
    print(value3);
  });

  print("main function end");
}

Future<String> getNetworkData() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    // 不再返回结果，而是出现异常
    return "network data1";
  });
}