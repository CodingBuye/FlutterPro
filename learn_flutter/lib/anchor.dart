import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

class Anchor {
  late String nickname;
  late String roomName;
  late String imageUrl;

  Anchor({
    required this.nickname,
    required this.roomName,
    required this.imageUrl
  });

  Anchor.withMap(Map<String, dynamic> parsedMap) {
    this.nickname = parsedMap["nickname"];
    this.roomName = parsedMap["roomName"];
    this.imageUrl = parsedMap["imageUrl"];
  }
}

Future<List<Anchor>> getAnchors() async {
  // 1.读取json文件
  String jsonString = await rootBundle.loadString("files/test.json");

  // 2.转成List或Map类型
  final jsonResult = json.decode(jsonString);

  // 3.遍历List，并且转成Anchor对象放到另一个List中
  List<Anchor> anchors = <Anchor>[];
  for (Map<String, dynamic> map in jsonResult) {
    anchors.add(Anchor.withMap(map));
  }
  return anchors;
}
