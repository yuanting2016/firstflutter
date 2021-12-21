///延时任务
import  'dart:async';
import  'dart:io';

void  main() {
  print("main start");

  new Future.delayed(new  Duration(seconds:1),(){
    print('task delayed');
  });

  new Future((){
    // 模拟耗时5秒
    sleep(Duration(seconds:5));
    print("5s task");
  });

  print("main stop");
}