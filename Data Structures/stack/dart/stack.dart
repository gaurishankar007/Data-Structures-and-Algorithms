void main() {
  final stack = Stack<int>();

  stack.push(1);
  stack.push(2);
  stack.push(3);

  print(stack); // [1, 2, 3]

  print(stack.pop()); // 3
  print(stack.pop()); // 2
  print(stack.pop()); // 1

  print(stack.isEmpty); // true
  print(stack); // []

  final stackNoTGrowable = StackNoTGrowable<int>(size: 3, defaultItem: -1);

  stackNoTGrowable.push(1);
  stackNoTGrowable.push(2);
  stackNoTGrowable.push(3);

  print(stackNoTGrowable); // [1, 2, 3]

  print(stackNoTGrowable.pop()); // 3
  print(stackNoTGrowable.pop()); // 2
  print(stackNoTGrowable.pop()); // 1

  print(stackNoTGrowable.isEmpty); // true

  print(stackNoTGrowable); // [-1, -1, -1]
}

class Stack<T> {
  List<T> _stack = <T>[];

  /// Add an element to the stack.
  void push(T item) {
    _stack.add(item);
  }

  /// Remove the last element from the stack and return it.
  T pop() {
    if (_stack.isEmpty) return throw StateError('Stack is empty');

    return _stack.removeLast();
  }

  /// Get the last element of the stack without removing it.
  T peek() {
    if (_stack.isEmpty) return throw StateError('Stack is empty');

    return _stack.last;
  }

  bool get isEmpty => _stack.isEmpty;

  int get length => _stack.length;

  @override
  String toString() => _stack.toString();
}

class StackNoTGrowable<T> {
  final int _size;
  final T _defaultItem;
  final List<T> _items;
  int _top = -1;

  StackNoTGrowable({required int size, required T defaultItem})
      : _size = size,
        _defaultItem = defaultItem,
        _items = List<T>.filled(size, defaultItem);

  /// Add an element to the stack.
  void push(T item) {
    if (_top == _size - 1) throw StateError('Stack is full');

    _items[++_top] = item;
  }

  /// Remove the last element from the stack and return it.
  T pop() {
    if (_top == -1) return throw StateError('Stack is empty');

    final value = _items[_top];
    _items[_top--] = _defaultItem;
    return value;
  }

  /// Get the last element of the stack without removing it.
  T peak() {
    if (_top == -1) return throw StateError('Stack is empty');
    return _items[_top];
  }

  bool get isEmpty => _top == -1;

  bool get isFull => _top == _size - 1;

  int get length => _top + 1;

  @override
  String toString() => _items.toString();
}
