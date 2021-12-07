///库和可见性
/// import 和 library 关键字可以帮助你创建一个模块化和可共享的代码库。
/// 代码库不仅只是提供 API 而且还起到了封装的作用：以下划线（_）开头的成员仅在代码库中可见。 每个 Dart 程序都是一个库，即便没有使用关键字 library 指定
/// -----------1、使用库
/// import 'dart::html'
/// import 'package:test/test.dart';
/// 指定库前缀 如果你导入的两个代码库有冲突的标识符，你可以为其中一个指定前缀。比如如果 library1 和 library2 都有 Element 类，那么可以这么处理
// import 'package:lib1/lib1.dart';
// import 'package:lib2/lib2.dart' as lib2;
//
// // Uses Element from lib1.
// Element element1 = Element();
//
// // Uses Element from lib2.
// lib2.Element element2 = lib2.Element();
/// 导入库的一部分
// Import only foo.
// import 'package:lib1/lib1.dart' show foo;
//
// // Import all names EXCEPT foo.
// import 'package:lib2/lib2.dart' hide foo;
///------------2、实现库  https://dart.cn/guides/libraries/create-library-packages
/// 如何组织库的源文件
/// 如何使用 export命令
/// 何时使用 library 命令
/// 如何使用导入和导出命令实现多平台的库支持
///
///
///
///
///
///
///
///