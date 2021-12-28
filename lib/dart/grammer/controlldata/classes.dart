///Dart 是支持基于 mixin 继承机制的面向对象语言，所有对象都是一个类的实例，而除了 Null 以外的所有的类都继承自 Object 类。
///基于 mixin 的继承 意味着尽管每个类（top class Object? 除外）都只有一个超类，一个类的代码可以在其它多个类继承中重复使用。



/// ----------1、类的定义及初始化
class Point {
  late num x, y;
  static num factor = 0;
  //语法糖，等同于在函数体内：this.x = x;this.y = y;
  Point(this.x,this.y);

  void printInfo() => print('($x, $y)');

  static void printZValue() => print('$factor');
}

void main(){
  var p = new Point(100,200); // new 关键字可以省略
  p.printInfo(); // 输出(100, 200);
  Point.factor = 10;
  Point.printZValue(); // 输出10
}

    ///-----------2、实例变量
    ///所有未初始化的实例变量其值均为 null。
    ///所有实例变量均会隐式地声明一个 Getter 方法。非终值的实例变量和 late final 声明但未声明初始化的实例变量还会隐式地声明一个 Setter 方法

    ///-----------3、构造函数
    /// 声明一个与类名一样的函数即可声明一个构造函数（对于命名式构造函数 还可以添加额外的标识符）。大部分的构造函数形式是生成式构造函数，其用于创建一个类的实例
    /// 除了默认构造函数 还有命名式构造函数、重定向构造函数 、常量构造函数、工厂构造函数
    /// 构造函数不被继承
    /// 命名式构造函数
    const double xOrigin = 0;
    const double yOrigin = 0;
    // class Point1 {
    // double x = 0;
    // double y = 0;
    //
    // Point1(this.x, this.y)
    //
    // // Named constructor
    // Point1.test():
    //       x = xOrigin,
    //       y = yOrigin;
    // }

    /// 重定向构造函数
   class Point2 {
      num x, y, z;
      Point2(this.x, this.y) : z = 0; // 初始化变量z
      Point2.bottom(num x) : this(x, 0); // 重定向构造函数
      void printInfo() => print('($x,$y,$z)');
    }
    void main2(){
      var p = Point2.bottom(100);
      p.printInfo(); // 输出(100,0,0)
    }
    /// 常量构造函数
    ///如果类生成的对象都是不变的，可以在生成这些对象时就将其变为编译时常量。你可以在类的构造函数前加上 const 关键字并确保所有实例变量均为 final 来实现该功能
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}
    ///工厂构造函数
    ///使用 factory 关键字标识类的构造函数将会令该构造函数变为工厂构造函数，这将意味着使用该构造函数构造类的实例时并非总是会返回新的实例对象。例如，工厂构造函数可能会从缓存中返回一个实例，或者返回一个子类型的实例。
    //todo()
class Logger {
  final String name;
  bool mute = false;
  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache =
  <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(
        name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}




    ///-------------4、复用：使用继承和混入（Mixin）的方式实现   A类使用with关键字即可使用B类的方法
  class A{
      test(){}
  }
  class B with A{

  }
  void main3(){
      var tempB = B();
      tempB.test();
  }
