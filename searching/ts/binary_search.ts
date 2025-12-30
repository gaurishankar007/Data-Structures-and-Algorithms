const myList: number[] = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
const target1: number = 13;

const index: number = binarySearch(myList, target1);
if (index !== -1) {
  console.log(`Element found at index ${index}`);
} else {
  console.log("Element not found");
}

function binarySearch(arr: number[], target1: number): number {
  let low = 0;
  let high = arr.length - 1;

  while (low <= high) {
    const mid = Math.floor((low + high) / 2); // Calculate the middle index

    if (arr[mid] === target1) {
      return mid; // Element found, return its index
    } else if (arr[mid] < target1) {
      low = mid + 1; // If the target is greater, ignore the left half
    } else {
      high = mid - 1; // If the target is smaller, ignore the right half
    }
  }

  return -1; // Element not found
}
