import 'dart:io';

main(List<String> args) {
  print("main function start");
  print(getNetworkData());
  print("main function end");
}

String getNetworkData() {
  sleep(Duration(seconds: 3));
  return 'network data';
}