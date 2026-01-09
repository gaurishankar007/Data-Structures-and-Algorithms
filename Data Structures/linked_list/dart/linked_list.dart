void main() {
  final linkedList = LinkedList<int>();

  linkedList.add(1);
  linkedList.add(2);
  linkedList.add(3);

  print(linkedList); // [1, 2, 3]

  print(linkedList.remove()); // 3
  print(linkedList.remove()); // 2
  print(linkedList.remove()); // 1

  print(linkedList.isEmpty); // true
  print(linkedList); // []

  linkedList.add(1);
  linkedList.add(2);

  print(linkedList.peek()); // 2

  print(linkedList.isEmpty); // false
  print(linkedList); // [1, 2]
}

class Node<T> {
  final T value;
  Node<T>? next;

  Node(this.value);
}

class LinkedList<T> {
  Node<T>? head;

  /// Add an element to the linked list.
  void add(T value) {
    final node = Node(value);

    /// If the head is null, assign the node to the head.
    if (head == null) {
      head = node;
      return;
    }

    /// If the head is not null, reference the node to the next node.
    Node currentNode = head!;
    // Iterate through head until the reference to the next node is null.
    while (currentNode.next != null) {
      currentNode = currentNode.next!;
    }
    currentNode.next = node;
  }

  /// Add all elements to the linked list.
  void addAll(Iterable<T> values) {
    for (final value in values) {
      add(value);
    }
  }

  /// Remove the last element from the linked list and return it.
  T remove() {
    if (head == null) {
      throw StateError('Linked list is empty');
    } else if (head!.next == null) {
      final value = head!.value;
      head = null;
      return value;
    }

    /// If the head is not null, reference the node to the next node.
    Node currentNode = head!;
    Node previousNode = head!;

    // Iterate through head until the reference to the next node is null.
    while (currentNode.next != null) {
      previousNode = currentNode;
      currentNode = currentNode.next!;
    }

    previousNode.next = null;
    return currentNode.value;
  }

  /// Get the last element of the linked list without removing it.
  T peek() {
    if (head == null) throw StateError('Linked list is empty');

    /// If the head is not null, reference the node to the next node.
    Node currentNode = head!;

    // Iterate through head until the reference to the next node is null.
    while (currentNode.next != null) {
      currentNode = currentNode.next!;
    }

    return currentNode.value;
  }

  bool get isEmpty => head == null;

  int get length {
    if (head == null) return 0;

    int length = 1;
    Node currentNode = head!;

    // Iterate through head until the reference to the next node is null.
    while (currentNode.next != null) {
      currentNode = currentNode.next!;
      length++;
    }

    return length;
  }

  @override
  String toString() {
    if (head == null) return '[]';

    final List<T> list = [];
    Node currentNode = head!;

    // Iterate through head until the reference to the next node is null.
    while (currentNode.next != null) {
      list.add(currentNode.value);
      currentNode = currentNode.next!;
    }

    list.add(currentNode.value);
    return list.toString();
  }
}

class LinkedListWithTail<T> {
  Node<T>? head;
  Node<T>? tail; // Added tail pointer

  /// Add an element to the linked list.
  /// To Understand this code, you need to understand the memory allocation of variables in Dart.
  void add(T value) {
    final node = Node(value);

    if (head == null) {
      // If the list is empty, set both head and tail to the new node.
      head = node;
      tail = node; // Update tail to point to the new node
      return;
    }

    // If the list is not empty, append the new node after the tail.
    // First addition, A location for the Node, Head, Tail = A location for Node
    // Next addition, B location, Head/Tail(A).next = B location, Tail = B location
    // Next addition, C location, Tail(B).next = C location, Tail = C location
    // Result Head -> A -> B -> C -> Tail
    tail!.next = node;
    tail = node; // Update tail to point to the new node
  }

  // Other methods remain the same...
}
