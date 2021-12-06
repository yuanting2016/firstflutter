///
/// 变量
///
void main() {
  /// 1------------、dart变量仅存储对象的引用
  var name = "Jocelyn";
  /// 2------------、延迟初始化
  late String description;

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
