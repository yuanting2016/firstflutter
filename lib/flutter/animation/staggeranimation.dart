import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///实现一个高度从0增长到300像素，颜色由绿色渐变为红色，这个过程占据动画时长60%
///高度增长到300，沿X轴向右平移100像素，这个过程占用整个动画时间40%
// class StaggerAnimation extends StatelessWidget {
//   StaggerAnimation({ required Key key, required this.controller }): super(key: key){
//     //高度动画
//     height = Tween<double>(
//       begin:.0 ,
//       end: 300.0,
//     ).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Interval(
//           0.0, 0.6, //间隔，前60%的动画时间
//           curve: Curves.ease,
//         ),
//       ),
//     );
//
//     color = ColorTween(
//       begin:Colors.green ,
//       end:Colors.red,
//     ).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Interval(
//           0.0, 0.6,//间隔，前60%的动画时间
//           curve: Curves.ease,
//         ),
//       ),
//     );
//
//     padding = Tween<EdgeInsets>(
//       begin:EdgeInsets.only(left: .0),
//       end:EdgeInsets.only(left: 100.0),
//     ).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Interval(
//           0.6, 1.0, //间隔，后40%的动画时间
//           curve: Curves.ease,
//         ),
//       ),
//     );
//   }
//
//
//   final Animation<double> controller;
//   Animation<double> height;
//   Animation<EdgeInsets> padding;
//   Animation<Color> color;
//
//   Widget _buildAnimation(BuildContext context, Widget child) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       padding:padding.value ,
//       child: Container(
//         color: color.value,
//         width: 50.0,
//         height: height.value,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       builder: _buildAnimation,
//       animation: controller,
//     );
//   }
// }
class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => _playAnimation(),
            child: Text("start animation"),
          ),
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            //调用我们定义的交错动画Widget
            child: StaggerAnimation(controller: _controller),
          ),
        ],
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({
    Key? key,
    required this.controller,
  }) : super(key: key) {
    //高度动画
    height = Tween<double>(
      begin: .0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
  }

  late final Animation<double> controller;
  late final Animation<double> height;
  late final Animation<EdgeInsets> padding;
  late final Animation<Color?> color;

  Widget _buildAnimation(BuildContext context, child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}