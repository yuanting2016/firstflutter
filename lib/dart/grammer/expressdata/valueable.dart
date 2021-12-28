///
///
/// Dart语言跟Python这类脚本语言相同，void main()作为程序的入口函数
///
/// 变量
///
void main() {
  /// 1------------、dart变量仅存储对象的引用，所有的对象均继承至Object,没有初始化的变量均为null,不会出现undefine或者烫烫烫烫
  var name = "Jocelyn";

  // String name1 = "Jocelyn";

  // Dart里面没有private public protected 等关键字，对变量，方法，类前加下划线_表示仅限库使用
  var _testName = "Jocelyn";









  /// 2------------、延迟初始化 Dart2.12y引入了延迟初始化
  late String description;
  description = "this is flutter";
  print(description);







  /// 3------------、final const
  /// 不可变
  final newName = "Jocelyn";
  // 常量
  const constVaries = "Jocelyn";


  /// 默认值为null,空安全？
  /// 在使用空安全的关键字时，需要将项目所有package迁移至空安全
  /// 迁移方法 https://dart.dev/null-safety/migration-guide
  int? lineCount = null;
}
