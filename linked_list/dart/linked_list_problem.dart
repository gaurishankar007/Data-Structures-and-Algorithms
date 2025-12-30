import 'linked_list.dart';

void main() {
  // Given a linked list, determine if it has a cycle in it.
  // A cycle is when a node's next pointer points back to a previous node in the list.

  // Example:
  // Input: 1 -> 2 -> 3 -> 4 -> 5 -> 2
  // Output: true
  // Explanation: In this example,
  // the node with value 2 points back to a previous node in the list, creating a cycle.

  final linkedList = LinkedList<int>();
  linkedList.addAll([1, 2, 3, 4, 5, 2]);
  print(hasCycle(linkedList)); // true
}

bool hasCycle(LinkedList<int> linkedList) {
  Node? currentNode = linkedList.head!;

  if (currentNode.next == null) return false;

  final List<int> list = [];
  while (currentNode != null) {
    if (list.contains(currentNode.value)) {
      return true;
    }

    list.add(currentNode.value);
    currentNode = currentNode.next;
  }

  return false;
}
