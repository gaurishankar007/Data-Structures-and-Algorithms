// --- Implementations ---

class Queue<T> {
  private elements: T[] = [];

  // Enqueue an element to the queue
  enqueue(element: T): void {
    this.elements.push(element);
  }

  // Add elements to the queue
  addAll(elements: T[]): void {
    this.elements.push(...elements);
  }

  // Dequeue an element from the queue
  dequeue(): T {
    if (this.isEmpty) throw new Error("Queue is empty");
    return this.elements.shift()!;
  }

  // Get the front element of the queue without removing it
  peek(): T {
    if (this.isEmpty) throw new Error("Queue is empty");
    return this.elements[0];
  }

  // Check if the queue is empty
  get isEmpty(): boolean {
    return this.elements.length === 0;
  }

  // Get the size of the queue
  get size(): number {
    return this.elements.length;
  }

  // Print the elements of the queue
  toString(): string {
    return `[${this.elements.join(", ")}]`;
  }
}

class QueueCircular<T> {
  private capacity: number;
  private defaultValue: T;
  private elements: T[];
  private front: number = 0;
  private rear: number = 0;
  private _size: number = 0;

  constructor(capacity: number, defaultValue: T) {
    this.capacity = capacity;
    this.defaultValue = defaultValue;
    this.elements = new Array(capacity).fill(defaultValue);
  }

  // Check if the queue is empty
  get isEmpty(): boolean {
    return this._size === 0;
  }

  // Check if the queue is full
  get isFull(): boolean {
    return this._size === this.capacity;
  }

  // Get the length of the queue
  get length(): number {
    return this._size;
  }

  // Enqueue an element to the queue
  enqueue(element: T): void {
    if (this.isFull) throw new Error("Queue is full");

    this.elements[this.rear] = element;
    this.rear = (this.rear + 1) % this.elements.length;
    this._size++;
  }

  // Dequeue an element from the queue
  dequeue(): T {
    if (this.isEmpty) throw new Error("Queue is empty");

    const element = this.elements[this.front];
    this.elements[this.front] = this.defaultValue;
    this.front = (this.front + 1) % this.elements.length;
    this._size--;

    return element;
  }

  // Get the front element of the queue without removing it
  peek(): T {
    if (this.isEmpty) throw new Error("Queue is empty");

    return this.elements[this.front];
  }

  // Print the elements of the queue
  toString(): string {
    return `[${this.elements.join(", ")}]`;
  }
}

// Example Usage
console.log("--- Linear Queue ---");
const queue = new Queue<number>();

// Enqueue elements
queue.enqueue(1);
queue.enqueue(2);
queue.enqueue(3);

// Print queue size
console.log(`Queue size: ${queue.size}`);

// Peek the front element
console.log(`Front element: ${queue.peek()}`);

// Dequeue elements and print them
while (!queue.isEmpty) {
  console.log(`Dequeued element: ${queue.dequeue()}`);
}

console.log("\n--- Circular Queue ---");
// Create a circular queue with a capacity of 4
const circularQueue = new QueueCircular<number>(4, -1);
circularQueue.enqueue(1);
circularQueue.enqueue(2);
console.log(circularQueue.toString());
circularQueue.enqueue(3);
circularQueue.enqueue(4);

// Print the front element
console.log(`Front element: ${circularQueue.peek()}`);

// Dequeue elements
console.log(`Dequeued element: ${circularQueue.dequeue()}`);
console.log(`Dequeued element: ${circularQueue.dequeue()}`);
console.log(circularQueue.toString());
circularQueue.enqueue(5);
console.log(circularQueue.toString());
