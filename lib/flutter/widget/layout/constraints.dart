import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///布局类组件就是指直接或间接继承(包含)SingleChildRenderObjectWidget 和MultiChildRenderObjectWidget的Widget，
///它们一般都会有一个child或children属性用于接收子  Widget。我们看一下继承关系 Widget > RenderObjectWidget > (Leaf/SingleChild/MultiChild)RenderObjectWidget
///RenderObjectWidget类中定义了创建、更新RenderObject的方法，子类必须实现他们，
///关于RenderObject我们现在只需要知道它是最终布局、渲染UI界面的对象即可，也就是说，对于布局类组件来说，其布局算法都是通过对应的RenderObject对象来实现的
///Flutter 中有两种布局模型：
// 基于 RenderBox 的盒模型布局。
// 基于 Sliver ( RenderSliver ) 按需加载列表布局。
// 两种布局方式在细节上略有差异，但大体流程相同，布局流程如下：
// 上层组件向下层组件传递约束（constraints）条件。
// 下层组件确定自己的大小，然后告诉上层组件。注意下层组件的大小必须符合父组件的约束。
// 上层组件确定下层组件相对于自身的偏移和确定自身的大小（大多数情况下会根据子组件的大小来确定自身的大小）。
// 任何时候子组件都必须先遵守父组件的约束

/// 是盒模型布局过程中父渲染对象传递给子渲染对象的约束信息，包含最大宽高信息，子组件大小需要在约束的范围内
// const BoxConstraints({
// this.minWidth = 0.0, //最小宽度
// this.maxWidth = double.infinity, //最大宽度
// this.minHeight = 0.0, //最小高度
// this.maxHeight = double.infinity //最大高度
// })


// ///用于对子组件添加额外的约束
// ConstrainedBox(
// constraints: BoxConstraints(
// minWidth: double.infinity, //宽度尽可能大
// minHeight: 50.0 //最小高度为50像素
// ),
// child: Container(
// height: 5.0,
// child: redBox ,
// ),
// )
//
// /// 用于给子元素指定固定的宽高
// SizedBox(
// width: 80.0,
// height: 80.0,
// child: redBox
// )

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

    /// 多重限制 我们发现有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突
///ConstrainedBox(
//   constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
//   child: ConstrainedBox(
//     constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
//     child: redBox,
//   )
// )
/// UnconstrainedBox
/// ConstrainedBox(
//   constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
//   child: UnconstrainedBox( //“去除”父级限制
//     child: ConstrainedBox(
//       constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
//       child: redBox,
//     ),
//   )
// )
/// 其他约束类容器
/// AspectRatio(指定子组件的长宽比)、LimitedBox（用于指定最大宽高） 、FractionallySizedBox（以根据父容器宽高的百分比来设置子组件宽高等）