void main() {
  MinHeap minHeap = MinHeap();
  minHeap.insert(10);
  minHeap.insert(4);
  minHeap.insert(6);
  minHeap.insert(3);
  minHeap.insert(8);

  print("Minimum element in the heap: ${minHeap.peek()}");

  while (!minHeap.isEmpty()) {
    print("Extracted min element: ${minHeap.extractMin()}");
  }
}

class MinHeap {
  List<int> _heap = [];

  MinHeap();

  // Get the parent index of a given index
  int _parentIndex(int index) {
    return (index - 1) ~/ 2;
  }

  // Get the left child index of a given index
  int _leftChildIndex(int index) {
    return 2 * index + 1;
  }

  // Get the right child index of a given index
  int _rightChildIndex(int index) {
    return 2 * index + 2;
  }

  // Swap two elements in the heap
  void _swap(int index1, int index2) {
    int temp = _heap[index1];
    _heap[index1] = _heap[index2];
    _heap[index2] = temp;
  }

  // Bubble up a newly added element to maintain heap property
  void _bubbleUp(int index) {
    while (index > 0 && _heap[index] < _heap[_parentIndex(index)]) {
      _swap(index, _parentIndex(index));
      index = _parentIndex(index);
    }
  }

  // Insert a new element into the heap
  void insert(int value) {
    _heap.add(value);
    _bubbleUp(_heap.length - 1);
  }

  // Bubble down an element to maintain heap property after removal
  void _bubbleDown(int index) {
    int smallest = index;
    int leftChildIndex = _leftChildIndex(index);
    int rightChildIndex = _rightChildIndex(index);

    if (leftChildIndex < _heap.length && _heap[leftChildIndex] < _heap[smallest]) {
      smallest = leftChildIndex;
    }

    if (rightChildIndex < _heap.length && _heap[rightChildIndex] < _heap[smallest]) {
      smallest = rightChildIndex;
    }

    if (smallest != index) {
      _swap(index, smallest);
      _bubbleDown(smallest);
    }
  }

  // Extract the minimum element from the heap
  int extractMin() {
    if (_heap.isEmpty) {
      throw StateError("Heap is empty");
    }
    int min = _heap[0];
    _heap[0] = _heap[_heap.length - 1];
    _heap.removeLast();
    _bubbleDown(0);
    return min;
  }

  // Get the minimum element from the heap without removing it
  int peek() {
    if (_heap.isEmpty) {
      throw StateError("Heap is empty");
    }
    return _heap[0];
  }

  // Check if the heap is empty
  bool isEmpty() {
    return _heap.isEmpty;
  }
}
