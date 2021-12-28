
/// 运算符分为： 算术运算符、关系运算符、类型判断运算符、赋值运算符、逻辑运算符、按位和移位运算符
/// 主要讲条件表达式中的几个常用运算符以及级联运算符
void main(){
  var a;
  a = 1;
  ///？. 表示 p 为 null 的时候跳过，避免抛出异常

  /// ??= 如果 a 为 null，则给 a 赋值 value，否则跳过。这种用默认值兜底的赋值语句在 Dart 中我们可以用 a ??= value 表示
  var b;
  b ??= 1;
  /// ?? 如果 a 不为 null，返回 a 的值，否则返回 b
  var c = a??b;
}

/// -----------级联运算符 级联运算符 (.., ?..) 可以让你在同一个对象上连续调用多个对象的变量或方法。
// todo buneng zuojilian
// var paint = Paint()
//   ..color = Colors.black
//   ..strokeCap = StrokeCap.round
//   ..strokeWidth = 5.0;
