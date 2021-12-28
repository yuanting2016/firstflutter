import 'dart:math';
///
/// 内置类型 number String bool
///
void main() {
  /// 1------------、Numbers,其子类有int和double
  /// 原生平台，比如android或者IOS平台，int的范围可以达到 -2^63 到 2^63 - 1。 但是在web环境中，可表示的范围是-2^53 到 2^53 - 1
  int age = 18;
  int number = 20;

  /// 浮点类型
  double money = 10.1;

  ///int double之间的转换
  int temp = money.toInt();
  double ages = 18.0.toDouble();

  ///除了常见的 “+ - * /”以及位运算符外，还可以使用继承自num的abs() round()等方法
  int roundY = temp.round();
  int abs = ages.abs().toInt();

  ///如果当前高级运算方法的需求num无法满足，还可以使用dart:math库，这个库提供了诸如三角函数、指数、对数、平方根等方法
  double sqrtResult = sqrt(ages);
  double tanResult = tan(30);




  /// 2------------、Strings字符串
  /// Dart 字符串（String 对象）包含了 UTF-16 编码的字符序列。可以使用单引号或者双引号来创建字符串
  var s = "string interpolation";
  var ss = "string interpolation";

  /// 字符串的拼接${expression}
  var agess = 10;
  var words = 'your age is ${agess}!';

  ///两个字符串可以用==来比较是否相等
  if (agess == "agess") {
    print("result is ok");
  }

  ///三个单引号或者三个双引号也能创建多行字符串：
  var s1 = '''
You can create
multi-line strings like this one.
''';

  var s2 = """This is also a
multi-line string.""";

  /// 在字符串前加上 r 作为前缀创建 “raw” 字符串（即不会被做任何处理（比如转义）的字符串）：
  var sw = r'In a raw string, not even \n gets special treatment.';







  /// 3------------、布尔类型  bool 关键字表示布尔类型，布尔类型只有两个对象 true 和 false，两者都是编译时常量
  var name = '';
  if (name.isEmpty) {}
  /// 注意不能像kotlin java 一样在判断 if(name != null)
  // if(name != null) {
  //
  // }





  /// 4------------、数组由List对象表示，通常称之为 List,
  var list = ['car', 'boat', 'plane'];

  ///Dart 在 2.3 引入了 扩展操作符（...）和 空感知扩展操作符（...?），它们提供了一种将多个元素插入集合的简洁方法。
  var list1 = [1, 2, 3];
  var list2 = [0, ...list1];
  assert(list2.length == 4);

  ///如果扩展操作符右边可能为 null ，你可以使用 null-aware 扩展操作符（...?）来避免产生异常：
  var list11;
  var list22 = [0, ...?list11];
  assert(list22.length == 1);

  // /// 5------------、在 Dart 中，set 是一组特定元素的无序集合。 Dart 支持的集合由集合的字面量和 Set 类提供
  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // var names = <String>{};
  // // Set<String> names = {}; // This works, too.
  // // var names = {}; // Creates a map, not a set.
  // /// 6------------、Map 是用来关联 keys 和 values 的对象。其中键和值都可以是任何类型的对象。每个 键 只能出现一次但是 值 可以重复出现多次
  // var gifts = {
  //   // Key:    Value
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 'golden rings'
  // };
  //
  // var nobleGases = {
  //   2: 'helium',
  //   10: 'neon',
  //   18: 'argon',
  // };

  ///Map 可以像 List 一样支持使用扩展操作符（... 和 ...?）以及集合的 if 和 for 操作。你可以查阅 List 扩展操作符 和 List 集合操作符 获取更多相关信息。
}
