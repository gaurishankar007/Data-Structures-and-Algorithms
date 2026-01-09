class CustomArray<T> {
  private length: number;
  private data: { [key: number]: T };

  constructor() {
    this.length = 0;
    this.data = {};
  }

  // Get element at index
  get(index: number): T {
    return this.data[index];
  }

  // Push element to end
  push(item: T): number {
    this.data[this.length] = item;
    this.length++;
    return this.length;
  }

  // Remove last element
  pop(): T {
    if (this.length === 0) {
      return undefined as any;
    }
    const lastItem = this.data[this.length - 1];
    delete this.data[this.length - 1];
    this.length--;
    return lastItem;
  }

  // Delete element at index
  delete(index: number): T {
    const item = this.data[index];
    this.shiftItems(index);
    return item;
  }

  // Insert element at index (manual implementation to show shift)
  insert(index: number, item: T): number {
    this.shiftItemsForInsert(index);
    this.data[index] = item;
    this.length++;
    return this.length;
  }

  private shiftItems(index: number) {
    for (let i = index; i < this.length - 1; i++) {
      this.data[i] = this.data[i + 1];
    }
    delete this.data[this.length - 1];
    this.length--;
  }

  private shiftItemsForInsert(index: number) {
    for (let i = this.length; i > index; i--) {
      this.data[i] = this.data[i - 1];
    }
  }

  print(): void {
    const elements = [];
    for (let i = 0; i < this.length; i++) {
      elements.push(this.data[i]);
    }
    console.log(`[${elements.join(", ")}]`);
  }
}

// Example Usage
const myArray = new CustomArray<string>();
myArray.push("hi");
myArray.push("you");
myArray.push("!");
myArray.pop();
myArray.delete(0);
myArray.push("there");
myArray.insert(1, "nice");
myArray.print(); // Expect: [you, nice, there]
