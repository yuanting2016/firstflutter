import 'dart:async';
/// 调度任务例子
void main(){
  print("main start");
  /// 将任务添加到MicroTask
  ///
  //   // 3 将任务添加到Event队列
    new  Future(myTask);

  // 1. 使用 scheduleMicrotask 方法添加
  // scheduleMicrotask(myTask);

  // // 2. 使用Future对象添加
  new  Future.microtask(myTask1);


  print("main stop");
}


void myTask(){
  print("this is my task");
}
void myTask1(){
  print("this is my task11111");
}