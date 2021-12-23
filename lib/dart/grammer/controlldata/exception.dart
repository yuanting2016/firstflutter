/// 异常 Java 不同的是，Dart 的所有异常都是非必检异常，方法不必声明会抛出哪些异常，并且你也不必捕获任何异常
void main() {
  /// ---------1、抛出异常 Throw
  throw FormatException('Expected at least 1 section');
  // throw 'Out of llamas!';








  ///---------2、捕获异常 catch
  // try {
  //   breedMoreLlamas();
  // } on OutOfLlamasException {
  //   buyMoreLlamas();
  // }
  ///可以为 catch 方法指定两个参数，第一个参数为抛出的异常对象，第二个参数为栈信息 StackTrace 对象
  try {
    // ···
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  }

  ///可以使用 on 或 catch 来捕获异常，使用 on 来指定异常类型，使用 catch 来捕获异常对象，两者可同时使用。
  ///关键字 rethrow 可以将捕获的异常再次抛出
  ///----------3、finally 无论是否抛出异常，finally 语句始终执行，如果没有指定 catch 语句来捕获异常，则异常会在执行完 finally 语句后抛出：

}
