import Foundation

print("--- Linked List ---")
let linkedList = LinkedList<Int>()

linkedList.add(1)
linkedList.add(2)
linkedList.add(3)

print(linkedList) // [1, 2, 3]

if let removed = try? linkedList.remove() { print(removed) } // 3
if let removed = try? linkedList.remove() { print(removed) } // 2
if let removed = try? linkedList.remove() { print(removed) } // 1

print(linkedList.isEmpty) // true
print(linkedList) // []

linkedList.add(1)
linkedList.add(2)

if let peeked = try? linkedList.peek() { print(peeked) } // 2

print(linkedList.isEmpty) // false
print(linkedList) // [1, 2]


// --- Implementations ---

class Node<T> {
    let value: T
    var next: Node<T>?

    init(value: T) {
        self.value = value
    }
}

class LinkedList<T>: CustomStringConvertible {
    var head: Node<T>?

    // Add an element to the linked list.
    func add(_ value: T) {
        let node = Node(value: value)

        // If the head is nil, assign the node to the head.
        if head == nil {
            head = node
            return
        }

        // If the head is not nil, traverse to the end.
        var currentNode = head!
        while currentNode.next != nil {
            currentNode = currentNode.next!
        }
        currentNode.next = node
    }

    // Add all elements to the linked list.
    func addAll(_ values: [T]) {
        for value in values {
            add(value)
        }
    }

    // Remove the last element from the linked list and return it.
    func remove() throws -> T {
        guard let headNode = head else {
            throw LinkedListError.empty
        }

        if headNode.next == nil {
            let value = headNode.value
            head = nil
            return value
        }

        var currentNode = headNode
        var previousNode = headNode

        while currentNode.next != nil {
            previousNode = currentNode
            currentNode = currentNode.next!
        }

        previousNode.next = nil
        return currentNode.value
    }

    // Get the last element of the linked list without removing it.
    func peek() throws -> T {
        guard let headNode = head else { throw LinkedListError.empty }

        var currentNode = headNode
        while currentNode.next != nil {
            currentNode = currentNode.next!
        }
        return currentNode.value
    }

    var isEmpty: Bool {
        return head == nil
    }

    var description: String {
        var list: [T] = []
        var currentNode = head
        while let node = currentNode {
            list.append(node.value)
            currentNode = node.next
        }
        return "\(list)"
    }
}

class LinkedListWithTail<T> {
    var head: Node<T>?
    var tail: Node<T>?

    func add(_ value: T) {
        let node = Node(value: value)
        if head == nil {
            head = node
            tail = node
            return
        }
        tail?.next = node
        tail = node
    }
}

enum LinkedListError: Error {
    case empty
}