void main() {
  /// 真正面向对象的语言，所以即便函数也是对象并且类型为 Function

  bool isNoble(int atomicNumber) {
    return false;
  }

  /// 1------------、参数   函数可以有两种形式的参数：必要参数 和 可选参数。必要参数定义在参数列表前面，可选参数则定义在必要参数后面。可选参数可以是 命名的 或 位置的。
  /// 命名参数默认为可选参数，除非他们被特别标记为 required。
  /// const Scrollbar({Key? key, required Widget child})
  /// 可选的位置参数  使用 [] 将一系列参数包裹起来作为位置参数：
  String say(String from, String msg, [String? device]) {
    return "";
  }

  /// 默认参数值  可以用 = 为函数的命名参数和位置参数定义默认值，默认值必须为编译时常量，没有指定默认值的情况下默认值为 null





  /// 2------------、main()函数 每个 Dart 程序都必须有一个 main() 顶级函数作为程序的入口， main() 函数返回值为 void 并且有一个
  /// 一个简单 main() 函数
  // void main() {
  //   print('Hello, World!');
  // }
  /// 使用命令行访问带参数的main()函数示例
  void main(List<String> arguments) {
    print(arguments);

    assert(arguments.length == 2);
    assert(int.parse(arguments[0]) == 1);
    assert(arguments[1] == 'test');
  }







  /// 3------------、函数是一级对象 可以将函数作为参数传递给另一个函数
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];
// Pass printElement as a parameter.
  list.forEach(printElement);

  /// 可以将函数赋值给一个变量
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');







  /// 4------------、匿名函数  大多数方法都是有名字的，比如 main() 或 printElement()。你可以创建一个没有名字的方法，称之为 匿名函数、 Lambda 表达式 或 Closure 闭包。你可以将匿名方法赋值给一个变量然后使用它，比如将该变量添加到集合或从中删除
//   ([[类型] 参数[, …]]) {
//   函数体;
// };
  const list1 = ['apples', 'bananas', 'oranges'];
  list1.forEach((item) {
    print('${list1.indexOf(item)}: $item');
  });

  ///如果函数体内只有一行返回语句，你可以使用胖箭头缩写法
  list.forEach((item) => print('${list.indexOf(item)}: $item'));







  ///5------------、Dart 是词法有作用域语言，变量的作用域在写代码的时候就确定了，大括号内定义的变量只能在大括号内访问
  bool topLevel = true;

  void main1() {
    var insideMain = true;

    void myFunction() {
      var insideFunction = true;

      void nestedFunction() {
        var insideNestedFunction = true;
        assert(topLevel);
        assert(insideMain);
        assert(insideFunction);
        assert(insideNestedFunction);
      }
    }
  }





  ///6------------、词法闭包 闭包 即一个函数对象，即使函数对象的调用在它原始作用域之外，依然能够访问在它词法作用域内的变量。
  /// 函数可以封闭定义到它作用域内的变量。接下来的示例中，函数 makeAdder() 捕获了变量 addBy。无论函数在什么时候返回，它都可以使用捕获的 addBy 变量
  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  void main11() {
    // Create a function that adds 2.
    var add2 = makeAdder(2);

    // Create a function that adds 4.
    var add4 = makeAdder(4);

    assert(add2(3) == 5);
    assert(add4(3) == 7);
  }

  /// 7--------------、所有的函数都有返回值。没有显示返回语句的函数最后一行默认为执行 return null;。
}
