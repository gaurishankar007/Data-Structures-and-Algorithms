// --- Implementations ---

class LinkedListNode<T> {
  value: T;
  next: LinkedListNode<T> | null = null;

  constructor(value: T) {
    this.value = value;
  }
}

class LinkedList<T> {
  head: LinkedListNode<T> | null = null;

  // Add an element to the linked list.
  add(value: T): void {
    const node = new LinkedListNode(value);

    if (this.head === null) {
      this.head = node;
      return;
    }

    let currentNode = this.head;
    while (currentNode.next !== null) {
      currentNode = currentNode.next;
    }
    currentNode.next = node;
  }

  // Add all elements to the linked list.
  addAll(values: T[]): void {
    for (const value of values) {
      this.add(value);
    }
  }

  // Remove the last element from the linked list and return it.
  remove(): T {
    if (this.head === null) {
      throw new Error("Linked list is empty");
    } else if (this.head.next === null) {
      const value = this.head.value;
      this.head = null;
      return value;
    }

    let currentNode = this.head;
    let previousNode = this.head;

    while (currentNode.next !== null) {
      previousNode = currentNode;
      currentNode = currentNode.next;
    }

    previousNode.next = null;
    return currentNode.value;
  }

  // Get the last element of the linked list without removing it.
  peek(): T {
    if (this.head === null) throw new Error("Linked list is empty");

    let currentNode = this.head;
    while (currentNode.next !== null) {
      currentNode = currentNode.next;
    }

    return currentNode.value;
  }

  get isEmpty(): boolean {
    return this.head === null;
  }

  toString(): string {
    if (this.head === null) return "[]";

    const list: T[] = [];
    let currentNode: LinkedListNode<T> | null = this.head;
    while (currentNode !== null) {
      list.push(currentNode.value);
      currentNode = currentNode.next;
    }
    return `[${list.join(", ")}]`;
  }
}

class LinkedListWithTail<T> {
  head: LinkedListNode<T> | null = null;
  tail: LinkedListNode<T> | null = null;

  add(value: T): void {
    const node = new LinkedListNode(value);
    if (this.head === null) {
      this.head = node;
      this.tail = node;
      return;
    }
    if (this.tail) {
      this.tail.next = node;
      this.tail = node;
    }
  }
}

// Example Usage
console.log("--- Linked List ---");
const linkedList = new LinkedList<number>();

linkedList.add(1);
linkedList.add(2);
linkedList.add(3);

console.log(linkedList.toString()); // [1, 2, 3]

console.log(linkedList.remove()); // 3
console.log(linkedList.remove()); // 2
console.log(linkedList.remove()); // 1

console.log(linkedList.isEmpty); // true
console.log(linkedList.toString()); // []

linkedList.add(1);
linkedList.add(2);

console.log(linkedList.peek()); // 2

console.log(linkedList.isEmpty); // false
console.log(linkedList.toString()); // [1, 2]
