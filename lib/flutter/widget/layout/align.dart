///调整一个子元素在父元素中的位置
// Align({
// Key key,
// this.alignment = Alignment.center,
// this.widthFactor,
// this.heightFactor,
// Widget child,
// })
///Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0) 。x、y的值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离，因此2个水平（或垂直）单位则等于矩形的宽（或高），如Alignment(-1.0, -1.0)
///代表矩形的左侧顶点，而Alignment(1.0, 1.0)代表右侧底部终点，而Alignment(1.0, -1.0) 则正是右侧顶点，即Alignment.topRight。为了使用方便，矩形的原点、四个顶点，以及四条边的终点在Alignment类中都已经定义为了静态常量
/// FractionalOffset : 标原点为矩形的左侧顶点,这和布局系统的一致
// Container(
// height: 120.0,
// width: 120.0,
// color: Colors.blue[50],
// child: Align(
// alignment: FractionalOffset(0.2, 0.6),
// child: FlutterLogo(
// size: 60,
// ),
// ),
// )
///class Center extends Align {
//   const Center({ Key? key, double widthFactor, double heightFactor, Widget? child })
//     : super(key: key, widthFactor: widthFactor, heightFactor: heightFactor, child: child);
// }

