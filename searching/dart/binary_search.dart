void main() {
  List<int> myList = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
  int target = 13;

  int index = binarySearch(myList, target);
  if (index != -1) {
    print("Element found at index $index");
  } else {
    print("Element not found");
  }
}

int binarySearch(List<int> arr, int target) {
  int low = 0;
  int high = arr.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2; // Calculate the middle index

    if (arr[mid] == target) {
      return mid; // Element found, return its index
    } else if (arr[mid] < target) {
      low = mid + 1; // If the target is greater, ignore the left half
    } else {
      high = mid - 1; // If the target is smaller, ignore the right half
    }
  }

  return -1; // Element not found
}
