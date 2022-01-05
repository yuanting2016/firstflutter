/// 文本控件相关属性
/// text相关的参数可分为两类，1、控制整体文本布局的参数  2、控制文本展示样式的参数
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
      home: Center(child: Text(
        '文本是视图系统中的常见控件，用来显示一段特定样式的字符串，就比如Android里的TextView，或是iOS中的UILabel。',
        /// 控制整体文本布局的参数 文本对齐方式 textAlign、文本排版方向 textDirection，文本显示最大行数 maxLines、文本截断规则 overflow
        textAlign: TextAlign.center,//居中显示
        /// 控制文本展示样式的参数 字体名称 fontFamily、字体大小 fontSize、文本颜色 color、文本阴影 shadows 等等，这些参数被统一封装到了构造函数中的参数 style 中
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),//20号红色粗体展示
      )));
  }
  /// 多种混合展示样式与单一样式的关键区别在于分片，一段字符串中支持多种混合展示样式，在Android中类似SpannableString,在flutter中即TextSpan

  TextStyle blackStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black); //黑色样式

  TextStyle redStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red); //红色样式

  // Text.rich(
  // TextSpan(
  // children: <TextSpan>[
  // TextSpan(text:'文本是视图系统中常见的控件，它用来显示一段特定样式的字符串，类似', style: redStyle), //第1个片段，红色样式
  // TextSpan(text:'Android', style: blackStyle), //第1个片段，黑色样式
  // TextSpan(text:'中的', style:redStyle), //第1个片段，红色样式
  // TextSpan(text:'TextView', style: blackStyle) //第1个片段，黑色样式
  // ]),
  // textAlign: TextAlign.center,
  // );



/// 使用字体资源（可以放到asset下面，或者package里面），首先再pubspec.yaml中声明它，然后将字体文件复制到pubspec.yaml中指定的位置。使用得时候再在textStyle中引用
/// const textStyle = const TextStyle(
//   fontFamily: 'Raleway',
//   package: 'my_package', //指定包名
// );


///
}
