class MinHeap {
  private heap: number[] = [];

  constructor() {}

  // Get the parent index of a given index
  private parentIndex(index: number): number {
    return Math.floor((index - 1) / 2);
  }

  // Get the left child index of a given index
  private leftChildIndex(index: number): number {
    return 2 * index + 1;
  }

  // Get the right child index of a given index
  private rightChildIndex(index: number): number {
    return 2 * index + 2;
  }

  // Swap two elements in the heap
  private swap(index1: number, index2: number): void {
    const temp = this.heap[index1];
    this.heap[index1] = this.heap[index2];
    this.heap[index2] = temp;
  }

  // Bubble up a newly added element to maintain heap property
  private bubbleUp(index: number): void {
    let currentIndex = index;
    while (
      currentIndex > 0 &&
      this.heap[currentIndex] < this.heap[this.parentIndex(currentIndex)]
    ) {
      this.swap(currentIndex, this.parentIndex(currentIndex));
      currentIndex = this.parentIndex(currentIndex);
    }
  }

  // Insert a new element into the heap
  insert(value: number): void {
    this.heap.push(value);
    this.bubbleUp(this.heap.length - 1);
  }

  // Bubble down an element to maintain heap property after removal
  private bubbleDown(index: number): void {
    let smallest = index;
    const leftIndex = this.leftChildIndex(index);
    const rightIndex = this.rightChildIndex(index);

    if (
      leftIndex < this.heap.length &&
      this.heap[leftIndex] < this.heap[smallest]
    ) {
      smallest = leftIndex;
    }

    if (
      rightIndex < this.heap.length &&
      this.heap[rightIndex] < this.heap[smallest]
    ) {
      smallest = rightIndex;
    }

    if (smallest !== index) {
      this.swap(index, smallest);
      this.bubbleDown(smallest);
    }
  }

  // Extract the minimum element from the heap
  extractMin(): number {
    if (this.heap.length === 0) {
      throw new Error("Heap is empty");
    }
    const min = this.heap[0];
    this.heap[0] = this.heap[this.heap.length - 1];
    this.heap.pop();
    this.bubbleDown(0);
    return min;
  }

  // Get the minimum element from the heap without removing it
  peek(): number {
    if (this.heap.length === 0) {
      throw new Error("Heap is empty");
    }
    return this.heap[0];
  }

  // Check if the heap is empty
  isEmpty(): boolean {
    return this.heap.length === 0;
  }
}

// Usage Example
const minHeap = new MinHeap();
minHeap.insert(10);
minHeap.insert(4);
minHeap.insert(6);
minHeap.insert(3);
minHeap.insert(8);

console.log(`Minimum element in the heap: ${minHeap.peek()}`);

while (!minHeap.isEmpty()) {
  console.log(`Extracted min element: ${minHeap.extractMin()}`);
}
