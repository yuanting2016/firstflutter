/// button控件相关属性
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("导航"),),
        body: RaisedButton(onPressed: () {
          setState(() {
          
          });
        }, child: Center(child: Column(children: [
          /// 一个圆形的按钮，一般出现在屏幕内容的前面，用来处理界面中最常用、最基础的用户动作
           FloatingActionButton(onPressed: (){}, child: Text("圆形的按钮")),
           /// 扁平化的按钮，默认透明背景，被点击后会呈现灰色背景
           TextButton(onPressed: (){}, child: Text("扁平化的按钮")),
           /// 凸起的按钮，默认带有灰色背景，被点击后灰色背景会加深
          ElevatedButton(onPressed: (){},child: Text("凸起的按钮")),
          OutlinedButton(onPressed: (){}, child: Text("带边框的按钮"))
        ],),),),
      ),
    );
  }

}
