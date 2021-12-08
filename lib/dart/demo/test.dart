///Dart语法实践
/// 先实现一个购物车程序，不使用Dart独有特性，再一步步加入特性，将其改造
//定义商品Item类
class Item {
  double price = 0;
  String name = "";
  Item(name, price) {
    this.name = name;
    this.price = price;
  }
  // Item(this.name, this.price);
}

//定义购物车类
class ShoppingCart {
  String name = "";
  DateTime date = new DateTime.now();
  String code = "";
  List<Item> bookings = [];

  price() {
    double sum = 0.0;
    for(var i in bookings) {
      sum += i.price;
    }
    return sum;
  }

  ShoppingCart(name, code) {
    this.name = name;
    this.code = code;
    this.date = DateTime.now();
  }
  //删掉了构造函数函数体 ShoppingCart(this.name, this.code) : date = DateTime.now();

  getInfo() {
    return '购物车信息:' +
        '\n-----------------------------' +
        '\n用户名: ' + name +
        '\n优惠码: ' + code +
        '\n总价: ' + price().toString() +
        '\n日期: ' + date.toString() +
        '\n-----------------------------';
  }
  //getInfo () => '''
// 购物车信息:
// -----------------------------
//   用户名: $name
//   优惠码: $code
//   总价: $price
//   Date: $date
// -----------------------------
// ''';
}
void main() {
  ShoppingCart sc = ShoppingCart('张三', '123456');
  sc.bookings = [Item('苹果',10.0), Item('鸭梨',20.0)];
  print(sc.getInfo());
}
/// 类抽象改造 第一步简化构造函数 第二步抽象基类
// class Meta {
//   double price;
//   String name;
//   Meta(this.name, this.price);
// }
// class Item extends Meta{
//   Item(name, price) : super(name, price);
// }
//
// class ShoppingCart extends Meta{
//   DateTime date;
//   String code;
//   List<Item> bookings;
//
//   double get price {...}
//   ShoppingCart(name, this.code) : date = DateTime.now(),super(name,0);
//   getInfo() {...}
// }

/// 方法改造 重载运算符
 //获取price 我们可以重载Item类的 “+”运算符，并通过列表对象进行归纳合并操作即可实现

// class Item extends Meta{
//   ...
//   //重载了+运算符，合并商品为套餐商品
//   Item operator+(Item item) => Item(name + item.name, price + item.price);
// }
//
// class ShoppingCart extends Meta{
//   ...
//   //把迭代求和改写为归纳合并
//   double get price => bookings.reduce((value, element) => value + element).price;
//   ...
//   getInfo() {...}
// }
// getInfo 方法是打印出字符串，我们可以通过字符串拼接的方式，进行格式化组合。

// getInfo () => '''
// 购物车信息:
// -----------------------------
//   用户名: $name
//   优惠码: $code
//   总价: $price
//   Date: $date
// -----------------------------
// ''';
/// 对象初始化方式的优化

// class ShoppingCart extends Meta{
//   ...
//   //默认初始化方法，转发到withCode里
//   ShoppingCart({name}) : this.withCode(name:name, code:null);
//   //withCode初始化方法，使用语法糖和初始化列表进行赋值，并调用父类初始化方法
//   ShoppingCart.withCode({name, this.code}) : date = DateTime.now(), super(name,0);
//
//   //??运算符表示为code不为null，则用原值，否则使用默认值"没有"
//   getInfo () => '''
// 购物车信息:
// -----------------------------
//   用户名: $name
//   优惠码: ${code??"没有"}
//   总价: $price
//   Date: $date
// -----------------------------
// ''';
// }
//
// void main() {
//   ShoppingCart sc = ShoppingCart.withCode(name:'张三', code:'123456');
//   sc.bookings = [Item('苹果',10.0), Item('鸭梨',20.0)];
//   print(sc.getInfo());
//
//   ShoppingCart sc2 = ShoppingCart(name:'李四');
//   sc2.bookings = [Item('香蕉',15.0), Item('西瓜',40.0)];
//   print(sc2.getInfo());
// }

/// 购物车信息的打印，疯转到单独的类 PrintHelper，使用Mixin将功能添加到ShoppingCart类

// abstract class PrintHelper {
//   printInfo() => print(getInfo());
//   getInfo();
// }
//
// class ShoppingCart extends Meta with PrintHelper{
//   ...
// }

/// 最后还可以使用级联运算符“..”,在同一个对象上连续调用多个函数以及访问成员变量

// void main() {
//   ShoppingCart.withCode(name:'张三', code:'123456')
//     ..bookings = [Item('苹果',10.0), Item('鸭梨',20.0)]
//     ..printInfo();
//
//   ShoppingCart(name:'李四')
//     ..bookings = [Item('香蕉',15.0), Item('西瓜',40.0)]
//     ..printInfo();
// }