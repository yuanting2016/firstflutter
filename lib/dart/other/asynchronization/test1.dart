import 'dart:async';
import 'dart:io';

///Dart 代码库中有大量返回 Future 或 Stream 对象的函数，这些函数都是 异步 的，它们会在耗时操作（比如I/O）执行完毕前直接返回而不会等待耗时操作执行完毕。
///--------1、 Future
///使用 async 和 await，在 异步编程 codelab 中有更多描述 https://dart.cn/guides/libraries/library-tour#future
/// 使用 Future API，具体描述参考 库概览。
///必须在带有 async 关键字的 异步函数 中使用 await：
Future<void> main() async {
  //checkVersion();
  print('In main: version is ${await lookUpVersion()}');
}
///--------2、声明异步函数 异步函数 是函数体由 async 关键字标记的函数
Future<String> lookUpVersion() async => '1.0.0';
///-------3、Stream 异步数据队列 在Dart语言中，Stream有两种类型，一种是点对点的单订阅流（Single-subscription），另一种则是广播流。
///使用 async 关键字和一个 异步循环（使用 await for 关键字标识）。
///使用 Stream API。详情参考 库概览 https://dart.cn/guides/libraries/library-tour#stream
/// 单订阅流，单订阅流的特点是只允许存在一个监听器，即使该监听器被取消后，也不允许再次注册监听器
/// 创建Stream
//方法一： periodic
test1() async{
  // 使用 periodic 创建流，第一个参数为间隔时间，第二个参数为回调函数
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), callback);
  // await for循环从流中读取
  await for(var i in stream){
    print(i);
  }
}

// 可以在回调函数中对值进行处理，这里直接返回了
int callback(int value){
  return value;
}
// 方法二：fromFuture
test2() async{
  print("test start");
  Future<String> fut = Future((){
    return "async task";
  });

  // 从Future创建Stream
  Stream<String> stream = Stream<String>.fromFuture(fut);
  await for(var s in stream){
    print(s);
  }
  print("test end");
}
// 方法三：fromFutures 从多个Future创建Stream，即将一系列的异步任务放入Stream中，每个Future按顺序执行，执行完成后放入Stream
test3() async{
  print("test start");
  Future<String> fut1 = Future((){
    // 模拟耗时5秒
    sleep(Duration(seconds:5));
    return "async task1";
  });
  Future<String> fut2 = Future((){
    return "async task2";
  });

  // 将多个Future放入一个列表中，将该列表传入
  Stream<String> stream = Stream<String>.fromFutures([fut1,fut2]);
  await for(var s in stream){
    print(s);
  }
  print("test end");
}
//方法四：fromIterable 该方法从一个集合创建Stream，用法与上面例子大致相同
Stream<int> stream = Stream<int>.fromIterable([1,2,3]);
//方法五：value 用于从单个值创建Stream
test5() async{
  Stream<bool> stream = Stream<bool>.value(false);
  // await for循环从流中读取
  await for(var i in stream){
    print(i);
  }
}
/// 使用 listen 监听
/// StreamSubscription<T> listen(void onData(T event), {Function onError, void onDone(), bool cancelOnError})
/// Stream 的一些方法
// take 和takeWhile
//Stream<T> take(int count) 用于限制Stream中的元素数量
testListen1() async{
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), callback);
  // 当放入三个元素后，监听会停止，Stream会关闭
  stream = stream.take(3);

  await for(var i in stream){
    print(i);
  }
}
testListen2() async{
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), callback);
  stream = stream.takeWhile((x){
// 对当前元素进行判断，不满足条件则取消监听
    return x <= 3;
  });
}
//skip 和 skipWhile
testSkip1() async{
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), callback);
  stream = stream.take(5);
  // 表示从Stream中跳过两个元素
  stream = stream.skip(2);

  await for(var i in stream){
    print(i);
  }
}
//该方法只是从Stream中获取元素时跳过，被跳过的元素依然是被执行了的，所耗费的时间依然存在，其实只是跳过了执行完的结果而已
//Stream<T> skipWhile(bool test(T element)) 方法与takeWhile用法是相同的，传入一个函数对结果进行判断，表示跳过满足条件的
/// StreamController 流控制
testController() async{
  // 创建
  StreamController streamController = StreamController();
  // 放入事件
  streamController.add('element_1');
  streamController.addError("this is error");
  streamController.sink.add('element_2');
  streamController.stream.listen(
    print,
  onError: print,
  onDone: ()=>print("onDone"));
}
/// 广播流
testBroadcast() async{
  // 调用 Stream 的 asBroadcastStream 方法创建
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), (e)=>e)
      .asBroadcastStream();
  stream = stream.take(5);

  stream.listen(print);
  stream.listen(print);
}

/// StreamTransformer
// factory StreamTransformer.fromHandlers({
// void handleData(S data, EventSink<T> sink),
// void handleError(Object error, StackTrace stackTrace, EventSink<T> sink),
// void handleDone(EventSink<T> sink)
// })
