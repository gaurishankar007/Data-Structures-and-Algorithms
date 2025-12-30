void main() {
  // Given a linked list, determine if it has a cycle in it.
  // A cycle is when a node's next pointer points back to a previous node in the list.\

  // Example:
  // Input: 1 -> 2 -> 3 -> 4 -> 5 -> 2
  // Output: true
  // Explanation: In this example, the node with value 2 points back to
  // a previous node in the list, creating a cycle.

  ListNode head = ListNode(1);
  ListNode node2 = ListNode(2);
  ListNode node3 = ListNode(3);
  ListNode node4 = ListNode(4);
  ListNode node5 = ListNode(5);

  head.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;
  node5.next = node2; // creating a cycle

  print("Is cycle (Set)? ${hasCycleWithSet(head)}");
}

class ListNode {
  int value;
  ListNode? next;

  ListNode(this.value, [this.next]);
}

bool hasCycleWithSet(ListNode? head) {
  Set<int> visited = Set<int>();

  while (head != null) {
    if (visited.contains(head.value)) {
      return true; // Cycle detected
    }

    visited.add(head.value);
    head = head.next;
  }

  return false; // No cycle detected
}
