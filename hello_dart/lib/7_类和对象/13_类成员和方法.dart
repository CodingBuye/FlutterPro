main(List<String> args) {
  var stu = Student();
  stu.name = 'why';
  stu.sno = 110;
  stu.study();

  Student.time = '早上8点';
  // stu.time = '早上9点'; 错误做法, 实例对象不能访问类成员
  Student.attendClass();
  // stu.attendClass(); 错误做法, 实现对象补鞥呢访问类方法
}

class Student {
  String? name;
  int? sno;

  static String? time;

  study() {
    print('$name在学习');
  }

  static attendClass() {
    print('去上课');
  }
}
