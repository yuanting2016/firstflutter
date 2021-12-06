void main() {
///流程控制语句
///------------1、if 和 else 支持 if - else 语句，其中 else 是可选的
///------------2、for 循环   for in、foreach
  var candidates = [];
  for (final candidate in candidates) {
    candidate.interview();
  }
  var collection = [1, 2, 3];
  collection.forEach(print); // 1 2 3

///------------3、While 和 Do-While
// while (!isDone()) {
//
// }
//   do {
//     printLine();
//   } while (!atEndOfPage());
///------------4、Break 和 Continue
//   while (true) {
//     if (shutDownRequested()) break;
//     processIncomingRequests();
//   }
//   for (int i = 0; i < candidates.length; i++) {
//     var candidate = candidates[i];
//     if (candidate.yearsExperience < 5) {
//       continue;
//     }
//     candidate.interview();
//   }
  ///------------5、Switch 和 Case
  ///Switch 语句在 Dart 中使用 == 来比较整数、字符串或编译时常量，比较的两个对象必须是同一个类型且不能是子类并且没有重写 == 操作符。 枚举类型非常适合在 Switch 语句中使用
  ///Dart 支持空的 case 语句，允许其以 fall-through 的形式执行
  // var command = 'CLOSED';
  // switch (command) {
  //   case 'CLOSED': // Empty case falls through.
  //   case 'NOW_CLOSED':
  //   // Runs for both CLOSED and NOW_CLOSED.
  //     executeNowClosed();
  //     break;
  // }
  ///在非空 case 语句中想要实现 fall-through 的形式，可以使用 continue 语句配合 label 的方式实现
  // var command = 'CLOSED';
  // switch (command) {
  //   case 'CLOSED':
  //     executeClosed();
  //     continue nowClosed;
  // // Continues executing at the nowClosed label.
  //
  //   nowClosed:
  //   case 'NOW_CLOSED':
  //   // Runs for both CLOSED and NOW_CLOSED.
  //     executeNowClosed();
  //     break;
  // }
 //注意:每个 case 子句都可以有局部变量且仅在该 case 语句内可见。
  ///------------6、在开发过程中，可以在条件表达式为 false 时使用 — assert(条件, 可选信息); — 语句来打断代码的执行
  //assert(text != null);
  // 如何判断 assert 是否生效？assert 是否生效依赖开发工具和使用的框架：
  //
  // Flutter 在调试模式时生效。
  //
  // 一些开发工具比如 dartdevc 通常情况下是默认生效的。
  //
  // 其他一些工具，比如 dart run以及 dart2js 通过在运行 Dart 程序时添加命令行参数 --enable-asserts 使 assert 生效。
  //
  // 在生产环境代码中，断言会被忽略，与此同时传入 assert 的参数不被判断。
}