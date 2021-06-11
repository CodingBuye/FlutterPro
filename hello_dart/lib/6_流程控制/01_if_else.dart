/// 不支持非空即真或者非0即真，必须有明确的bool类型

main() {
  var name = null;
  if(name == null) {
    print(name);
  }
}