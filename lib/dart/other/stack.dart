import 'package:flutter/cupertino.dart';

/// 使用list实现栈
class Stack<E> {
  final List<E> _stack;
  final int capacity;
  int _top;

  Stack(this.capacity)
      : _top = -1,
        _stack = List.filled(capacity,  0 as E);

  bool get isEmpty => _top == -1;
  bool get isFull => _top == capacity - 1;
  int get size => _top + 1;

  void push(E e) {
    if (isFull) throw StackOverFlowException;
    _stack[++_top] = e;
  }

  E pop() {
    if (isEmpty) throw StackEmptyException;
    return _stack[_top--];
  }

  E get top {
    if (isEmpty) throw StackEmptyException;
    return _stack[_top];
  }
}

class StackOverFlowException implements Exception {
  const StackOverFlowException();
  String toString() => 'StackOverFlowException';
}

class StackEmptyException implements Exception {
  const StackEmptyException();
  String toString() => 'StackEmptyException';
}

void main() {
  var stack = Stack<int>(10);
  for (var i = 0; i < stack.capacity; i++) stack.push(i * i);
  print(stack.top);

  var buffer = StringBuffer();
  while (!stack.isEmpty) buffer.write('${stack.pop()} ');
  print(buffer.toString());
}
