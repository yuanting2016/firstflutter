import 'package:flutter/cupertino.dart';

/// 设置动画基本包括定义animation addListener setState 固定的这几步，那我们可以用AnimatedWidget类封装setState()的细节。
class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  // initState() {
  //   super.initState();
  //   controller = AnimationController(
  //     duration: const Duration(seconds: 2),
  //     vsync: this,
  //   );
  //
  //   //匀速
  //   //图片宽高从0变到300
  //   animation = Tween(begin: 0.0, end: 300.0).animate(controller)
  //     ..addListener(() {
  //       setState(() => {});
  //     });
  //
  //   //启动动画(正向执行)
  //   controller.forward();
  // }

  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
         ///设置监听
        ///dismissed 动画在起始点停止
        /// forward 动画正在正向执行
        /// reverse 动画正在反向执行
        /// completed 动画在终点停止
        setState(() => {});
      });
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/avatar.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
