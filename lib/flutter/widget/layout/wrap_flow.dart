import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///超出屏幕显示范围会自动折行的布局称为流式布局。Flutter中通过Wrap和Flow来支持流式布局，将上例中的 Row 换成Wrap后溢出部分则会自动折行
///
// Wrap({
// ...
// this.direction = Axis.horizontal,
// this.alignment = WrapAlignment.start,
// this.spacing = 0.0,
// this.runAlignment = WrapAlignment.start,
// this.runSpacing = 0.0,
// this.crossAxisAlignment = WrapCrossAlignment.start,
// this.textDirection,
// this.verticalDirection = VerticalDirection.down,
// List<Widget> children = const <Widget>[],
// })

void main() => runApp(new WrapFlowTestRoute());
class WrapFlowTestRoute extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
class _MyAppState extends State<WrapFlowTestRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:   Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.center, //沿主轴方向居中
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
          label: Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
          label: Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
          label: Text('Laurens'),
        ),
      ],
    ),);
  }

}
/// flow
// Flow(
// delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
// children: <Widget>[
// Container(width: 80.0, height:80.0, color: Colors.red,),
// Container(width: 80.0, height:80.0, color: Colors.green,),
// Container(width: 80.0, height:80.0, color: Colors.blue,),
// Container(width: 80.0, height:80.0,  color: Colors.yellow,),
// Container(width: 80.0, height:80.0, color: Colors.brown,),
// Container(width: 80.0, height:80.0,  color: Colors.purple,),
// ],
// )
///性能好；Flow是一个对子组件尺寸以及位置调整非常高效的控件，Flow用转换矩阵在对子组件进行位置调整的时候进行了优化：
///在Flow定位过后，如果子组件的尺寸或者位置发生了变化，在FlowDelegate中的paintChildren()方法中调用context.paintChild 进行重绘，而context.paintChild在重绘时使用了转换矩阵，并没有实际调整组件位置。
// 灵活；由于我们需要自己实现FlowDelegate的paintChildren()方法，所以我们需要自己计算每一个组件的位置，因此，可以自定义布局策略。
// 缺点：
//
// 使用复杂。
// Flow 不能自适应子组件大小，必须通过指定父容器大小或实现TestFlowDelegate的getSize返回固定大小。