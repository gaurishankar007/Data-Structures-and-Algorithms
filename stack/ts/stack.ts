class Stack<T> {
  private size: number;
  private stack: Array<T> = [];

  constructor(size: number) {
    this.size = size;
  }

  isEmpty(): boolean {
    return this.stack.length === 0;
  }

  isFull(): boolean {
    return this.stack.length === this.size;
  }

  length(): number {
    return this.stack.length;
  }

  push(item: T) {
    if (this.isFull()) {
      throw new Error("Stack is full.");
    }
  }

  pop(): T {
    if (this.isEmpty()) {
      throw new Error("Stack is empty.");
    }

    let poppedItem = this.stack.pop() as T;
    return poppedItem;
  }

  peek(): T {
    if (this.isEmpty()) {
      throw new Error("Stack is empty.");
    }

    let lastItemIndex: number = this.stack.length - 1;
    let item: T = this.stack[lastItemIndex];
    return item;
  }
}

const stack = new Stack<number>(5);
stack.push(6);
stack.push(9);
console.log(stack.pop());
console.log(stack.peek());
console.log(stack.length());
