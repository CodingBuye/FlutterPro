main() {
  // 创建List的方式
  var names1 = ['why', 'kobe', 'james', 111];
  print(names1.runtimeType); // List<Object>

  // 限制类型
  // var names2 = <String>['why', 'kobe', 'james', 111]; // 最后一个报错
  // List<String> names3 = ['why', 'kobe', 'james', 111]; // 最后一个报错

  // 创建Map的方式
  var infos1 = {1: 'one', 'name': 'why', 'age': 18};
  print(infos1.runtimeType); // _InternalLinkedHashMap<Object, Object>

  // 对类型进行限制
  // Map<String, String> infos2 = {'name': 'why', 'age': 18}; // 18不能放在value中
  // var infos3 = <String, String>{'name': 'why', 'age': 18}; // 18不能放在value中


}