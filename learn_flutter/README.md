# learn_flutter

A new Flutter project.

## Getting Started

- [Flutter(一)之Flutter开发初体验](https://mp.weixin.qq.com/s/UU2WO_YSoobthTTbniBm5Q)
  - 问题：Unimplemented handling of missing static target
  - 解决：只需再次编译该项目，它就会工作。发生此错误是因为静态变量在可执行文件上是硬编译的，而不是动态的。如果你热重新加载更改，它将不会重建可执行文件(apk)，所以这就是为什么你需要重建应用程序。
  - 参考：https://stackoverflow.com/questions/58055330/flutter-unimplemented-handling-of-missing-static-target/58530278#58530278?newreg=8cef03c436524eefbd4904e7c917c7f0

- [Flutter(二)之有状态的StatefulWidget](https://mp.weixin.qq.com/s/GJUXzwTY52JSjvCyernZKA)
  - 问题：RaisedButton已经启用，用ElevatedButton代替，按钮的颜色值设置出错
  - 解决：https://stackoverflow.com/questions/66835173/how-to-change-background-color-of-elevated-button-in-flutter-from-function
  
- [Flutter(三)之Flutter的基础Widget](https://mp.weixin.qq.com/s/xuECuEW3MLJpXBIwkREgCA)
  - 按钮有调整
  
- [Flutter(四)之Flutter的布局Widget](https://mp.weixin.qq.com/s/w33dctz-TmaYBZ9hXr4oig)