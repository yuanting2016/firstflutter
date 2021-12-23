/// 泛型
/// ----------1、使用集合字面量
var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines'
};
///-----------2、使用类型参数化的构造函数
void main() {
  var nameSet = Set<String>.from(names);
  var views = Map<int, double>();

  ///-----------3、泛型集合以及它们所包含的类型
  var namess = <String>[];
  namess.addAll(['Seth', 'Kathy', 'Lars']);
  print(namess is List<String>); // true
}




///-----------4、限制参数化类型
///有时使用泛型的时候，你可能会想限制可作为参数的泛型范围，也就是参数必须是指定类型的子类，这时候可以使用 extends 关键字
class Foo<T extends Object> {
  // Any type provided to Foo for T must be non-nullable.
}

///使用泛型方法
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
