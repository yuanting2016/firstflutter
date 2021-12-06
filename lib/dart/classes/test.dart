///Dart 是支持基于 mixin 继承机制的面向对象语言，所有对象都是一个类的实例，而除了 Null 以外的所有的类都继承自 Object 类。
///基于 mixin 的继承 意味着尽管每个类（top class Object? 除外）都只有一个超类，一个类的代码可以在其它多个类继承中重复使用。
/// 扩展方法 是一种在不更改类或创建子类的情况下向类添加功能的方式
void main() {
  /// ----------1、使用类的成员 ..对象的 成员 由函数和数据（即 方法 和 实例变量）组成。方法的 调用 要通过对象来完成，这种方式可以访问对象的函数和数据。
  ///使用（.）来访问对象的实例变量或方法：
//   var p = Point(2, 2);
//
// // Get the value of y.
//   assert(p.y == 2);
//
// // Invoke distanceTo() on p.
//   double distance = p.distanceTo(Point(4, 4));
  /// 使用 ?. 代替 . 可以避免因为左边表达式为 null 而导致的问题：
  // If p is non-null, set a variable equal to its y value.
  // var a = p?.y;
  ///----------2、可以使用 构造函数 来创建一个对象。构造函数的命名方式可以为 类名 或 类名 . 标识符 的形式
  // var p1 = new Point(2, 2);
  // var p2 = new Point.fromJson({'x': 1, 'y': 2});
  /// new 关键字可省略
  /// 一些类提供了常量构造函数。使用常量构造函数，在构造函数名之前加 const 关键字，来创建编译时常量
  /// ---------3、获取对象的类型 。可以使用 Object 对象的 runtimeType 属性在运行时获取一个对象的类型，该对象类型是 Type 的实例
  var a = "";
  print('The type of a is ${a.runtimeType}');

  ///-----------3、实例变量
  ///所有未初始化的实例变量其值均为 null。
  ///所有实例变量均会隐式地声明一个 Getter 方法。非终值的实例变量和 late final 声明但未声明初始化的实例变量还会隐式地声明一个 Setter 方法
  ///-----------4、构造函数
  /// 声明一个与类名一样的函数即可声明一个构造函数（对于命名式构造函数 还可以添加额外的标识符）。大部分的构造函数形式是生成式构造函数，其用于创建一个类的实例
  /// 默认构造函数
  /// 构造函数不被继承
  /// 命名式构造函数
  // const double xOrigin = 0;
  // const double yOrigin = 0;
  // class Point {
  // double x = 0;
  // double y = 0;
  //
  // Point(this.x, this.y);
  //
  // // Named constructor
  // Point.origin()
  //     : x = xOrigin,
  // y = yOrigin;
  // }
  /// 调用父类非默认构造函数
  // 默认情况下，子类的构造函数会调用父类的匿名无参数构造方法，并且该调用会在子类构造函数的函数体代码执行前，如果子类构造函数还有一个 初始化列表，那么该初始化列表会在调用父类的该构造函数之前被执行，总的来说，这三者的调用顺序如下：
  //1、初始化列表
  //Point.fromJson(Map<String, double> json)
  //     : x = json['x']!,
  //       y = json['y']! {
  //   print('In Point.fromJson(): ($x, $y)');
  // }
  //注意：
  //2、父类的无参数构造函数
  //3、当前类的构造函数
  //如果父类没有匿名无参数构造函数，那么子类必须调用父类的其中一个构造函数，为子类的构造函数指定一个父类的构造函数只需在构造函数体前使用（:）指定
  // class Person {
  // String? firstName;
  //
  // Person.fromJson(Map data) {
  // print('in Person');
  // }
  // }
  //
  // class Employee extends Person {
  // // Person does not have a default constructor;
  // // you must call super.fromJson(data).
  // Employee.fromJson(Map data) : super.fromJson(data) {
  // print('in Employee');
  // }
  // }
  //
  // void main() {
  // var employee = Employee.fromJson({});
  // print(employee);
  // // Prints:
  // // in Person
  // // in Employee
  // // Instance of 'Employee'
  // }
  /// 重定向构造函数
  // class Point {
  // double x, y;
  //
  // // The main constructor for this class.
  // Point(this.x, this.y);
  //
  // // Delegates to the main constructor.
  // Point.alongXAxis(double x) : this(x, 0);
  // }
  /// 常量构造函数
  ///如果类生成的对象都是不变的，可以在生成这些对象时就将其变为编译时常量。你可以在类的构造函数前加上 const 关键字并确保所有实例变量均为 final 来实现该功能
  ///工厂构造函数
  ///使用 factory 关键字标识类的构造函数将会令该构造函数变为工厂构造函数，这将意味着使用该构造函数构造类的实例时并非总是会返回新的实例对象。例如，工厂构造函数可能会从缓存中返回一个实例，或者返回一个子类型的实例。
  ///------------5、方法
  ///对象的实例方法可以访问实例变量和 this
  ///操作符 运算符是有着特殊名称的实例方法
  ///Getter 和Setter Getter 和 Setter 是一对用来读写对象属性的特殊方法，上面说过实例对象的每一个属性都有一个隐式的 Getter 方法，如果为非 final 属性的话还会有一个 Setter 方法，你可以使用 get 和 set 关键字为额外的属性添加 Getter 和 Setter 方法
  ///-----------6、抽象类
  ///使用关键字 abstract 标识类可以让该类成为 抽象类，抽象类将无法被实例化。抽象类常用于声明接口方法、有时也会有具体的方法实现。如果想让抽象类同时可被实例化，可以为其定义 工厂构造函数
  // abstract class AbstractContainer {
  //   // Define constructors, fields, methods...
  //
  //   void updateChildren(); // Abstract method.
  // }
  ///----------7、隐式接口
  ///每一个类都隐式地定义了一个接口并实现了该接口，这个接口包含所有这个类的实例成员以及这个类所实现的其它接口。如果想要创建一个 A 类支持调用 B 类的 API 且不想继承 B 类，则可以实现 B 类的接口
  // A person. The implicit interface contains greet().
//   class Person {
//   // In the interface, but visible only in this library.
//   final String _name;
//
//   // Not in the interface, since this is a constructor.
//   Person(this._name);
//
//   // In the interface.
//   String greet(String who) => 'Hello, $who. I am $_name.';
//   }
//
// // An implementation of the Person interface.
//   class Impostor implements Person {
//   String get _name => '';
//
//   String greet(String who) => 'Hi $who. Do you know who I am?';
//   }
//
//   String greetBob(Person person) => person.greet('Bob');
//
//   void main() {
//   print(greetBob(Person('Kathy')));
//   print(greetBob(Impostor()));
//   }
  ///------------8、扩展一个类  使用 extends 关键字来创建一个子类，并可使用 super 关键字引用一个父类： 与java kotlin 类似
  ///------------9、扩展方法  扩展方法是向现有库添加功能的一种方式。你可能已经在不知道它是扩展方法的情况下使用了它。例如，当您在 IDE 中使用代码完成功能时，它建议将扩展方法与常规方法一起使用
  ///------------10、枚举
  ///enum Color { red, green, blue }
  ///-------------11、Mixin 是一种在多重继承中复用某个类中代码的方法模式
  // class Musician extends Performer with Musical {
  // // ···
  // }
  //
  // class Maestro extends Person
  // with Musical, Aggressive, Demented {
  // Maestro(String maestroName) {
  // name = maestroName;
  // canConduct = true;
  // }
  // }
  ///-------------12、类变量和方法
  ///使用关键字 static 可以声明类变量或类方法。 注意：对于一些通用或常用的静态方法，应该将其定义为顶级函数而非静态方法
}
