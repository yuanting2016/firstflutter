import 'dart:async';

class EventBus {
  static late EventBus _instance;
  late StreamController _streamController;

  factory EventBus.getDefault() {
    return _instance;
  }

  EventBus._init() {
    _streamController = StreamController.broadcast();
  }

  StreamSubscription<T>? register<T>(void onData(T event)?) {
    Stream<T> stream;
    if (T == dynamic) {
      stream = _streamController.stream as Stream<T>;
    } else {
      stream =  _streamController.stream.where((type) => type is T).cast<T>();
      return stream.listen(onData);
    }
  }

  void post(event) {
    _streamController.add(event);
  }

  void unregister() {
    //todo
    _streamController.close();
  }
}
void main(){

}