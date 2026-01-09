import 'queue.dart';

void main() {
  // You are given a list of integers and a target value.
  // Write a function to determine if the target value exists in the list.
  // Implement this function using a queue.

  List<int> list = [1, 2, 3, 4, 5];
  int target = 3;

  print(containsTarget(list, target)); // true
}

// Implement the function to determine if the target value exists in the list.
bool containsTarget(List<int> list, int target) {
  final Queue<int> queue = Queue();
  queue.addAll(list);

  while (!queue.isEmpty) {
    int current = queue.dequeue();
    if (current == target) {
      return true;
    }
  }
  return false;
}
