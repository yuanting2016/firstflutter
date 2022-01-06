/// Stack、positioned
/// 层叠布局和 Web 中的绝对定位、Android 中的 Frame 布局是相似的，子组件可以根据距父容器四个角的位置来确定自身的位置。
/// 层叠布局允许子组件按照代码中声明的顺序堆叠起来。Flutter中使用Stack和Positioned这两个组件来配合实现绝对定位。
/// Stack允许子组件堆叠，而Positioned用于根据Stack的四个角来确定子组件的位置
// Stack({
// this.alignment = AlignmentDirectional.topStart,
// this.textDirection,
// this.fit = StackFit.loose,
// this.overflow = Overflow.clip,
// List<Widget> children = const <Widget>[],
// })
// const Positioned({
// Key? key,
// this.left,
// this.top,
// this.right,
// this.bottom,
// this.width,
// this.height,
// required Widget child,
// })