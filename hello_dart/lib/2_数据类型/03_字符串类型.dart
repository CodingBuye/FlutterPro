main(List<String> args) {
  // 1.定义字符串的方式
  var s1 = 'Hello World';
  var s2 = "Hello Dart";
  var s3 = 'Hello\'Fullter';
  var s4 = "Hello'Fullter";

  // 2.表示多行字符串的方式
  var message1 = '''
    哈哈哈
    呵呵呵
    嘿嘿嘿''';

  // 3.拼接其他变量
  var name = 'coderwhy';
  var age = 18;
  var height = 1.88;
  print('my name is ${name}, age is $age, height is $height');
}