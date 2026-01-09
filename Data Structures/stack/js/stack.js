class StackJS {
  size;
  stack = [];

  constructor(size) {
    this.size = size;
  }

  isEmpty() {
    return this.stack.length === 0;
  }

  isFull() {
    return this.stack.length === this.size;
  }

  length() {
    return this.stack.length;
  }

  push(item) {
    if (this.isFull()) {
      throw new Error("Stack is full.");
    }

    this.stack.push(item);
  }

  pop() {
    if (this.isEmpty()) {
      throw new Error("Stack is empty.");
    }

    let poppedItem = this.stack.pop();
    return poppedItem;
  }

  peek() {
    if (this.isEmpty()) {
      throw new Error("Stack is empty.");
    }

    let lastItemIndex = this.stack.length - 1;
    let item = this.stack[lastItemIndex];
    return item;
  }
}

const stackJS = new StackJS(5);
stackJS.push(6);
stackJS.push(9);
console.log(stackJS.pop());
console.log(stackJS.peek());
console.log(stackJS.length());
