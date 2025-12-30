void main() {
  Queue queue = Queue();

  // Enqueue elements
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);

  // Print queue size
  print('Queue size: ${queue.size}');

  // Peek the front element
  print('Front element: ${queue.peek()}');

  // Dequeue elements and print them
  while (!queue.isEmpty) {
    print('Dequeued element: ${queue.dequeue()}');
  }

  // Create a circular queue with a capacity of 3
  QueueCircular circularQueue = QueueCircular(capacity: 4, defaultValue: -1);
  circularQueue.enqueue(1);
  circularQueue.enqueue(2);
  print(circularQueue);
  circularQueue.enqueue(3);
  circularQueue.enqueue(4);

  // Print the front element
  print('Front element: ${circularQueue.peek()}');

  // Dequeue elements
  print('Dequeued element: ${circularQueue.dequeue()}');
  print('Dequeued element: ${circularQueue.dequeue()}');
  print(circularQueue);
  circularQueue.enqueue(5);
  print(circularQueue);
}

class Queue<T> {
  List<T> _elements = [];

  // Enqueue an element to the queue
  void enqueue(T element) {
    _elements.add(element);
  }

  // Add elements to the queue
  addAll(Iterable<T> elements) {
    _elements.addAll(elements);
  }

  // Dequeue an element from the queue
  T dequeue() {
    if (isEmpty) throw StateError('Queue is empty');
    return _elements.removeAt(0);
  }

  // Get the front element of the queue without removing it
  T peek() {
    if (isEmpty) throw StateError('Queue is empty');

    return _elements.first;
  }

  // Check if the queue is empty
  bool get isEmpty => _elements.isEmpty;

  // Get the size of the queue
  int get size => _elements.length;

  // Print the elements of the queue
  @override
  String toString() {
    return _elements.toString();
  }
}

class QueueCircular<T> {
  final int _capacity;
  final T _defaultValue;
  List<T> _elements = [];
  int _front = 0;
  int _rear = 0;
  int _size = 0;

  QueueCircular({required int capacity, required T defaultValue})
      : _capacity = capacity,
        _defaultValue = defaultValue,
        _elements = List.filled(capacity, defaultValue);

  // Check if the queue is empty
  bool get isEmpty => _size == 0;

  // Check if the queue is full
  bool get isFull => _size == _capacity;

  // Get the length of the queue
  int get length => _size;

  // Enqueue an element to the queue
  void enqueue(T element) {
    if (isFull) throw StateError('Queue is full');

    _elements[_rear] = element;
    _rear = (_rear + 1) % _elements.length;
    _size++;
  }

  // Dequeue an element from the queue
  T dequeue() {
    if (isEmpty) throw StateError('Queue is empty');

    T element = _elements[_front];
    _elements[_front] = _defaultValue;
    _front = (_front + 1) % _elements.length;
    _size--;

    return element;
  }

  // Get the front element of the queue without removing it
  T peek() {
    if (isEmpty) throw StateError('Queue is empty');

    return _elements[_front];
  }

  // Print the elements of the queue
  @override
  String toString() {
    return _elements.toString();
  }
}
