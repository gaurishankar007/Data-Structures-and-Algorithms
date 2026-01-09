import Foundation

print("--- Linear Queue ---")
let queue = Queue<Int>()

// Enqueue elements
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

// Print queue size
print("Queue size: \(queue.size)")

// Peek the front element
if let front = try? queue.peek() {
    print("Front element: \(front)")
}

// Dequeue elements and print them
while !queue.isEmpty {
    if let dequeued = try? queue.dequeue() {
        print("Dequeued element: \(dequeued)")
    }
}

print("\n--- Circular Queue ---")
// Create a circular queue with a capacity of 4
let circularQueue = QueueCircular<Int>(capacity: 4, defaultValue: -1)
try? circularQueue.enqueue(1)
try? circularQueue.enqueue(2)
print(circularQueue)
try? circularQueue.enqueue(3)
try? circularQueue.enqueue(4)

// Print the front element
if let front = try? circularQueue.peek() {
    print("Front element: \(front)")
}

// Dequeue elements
if let d1 = try? circularQueue.dequeue() { print("Dequeued element: \(d1)") }
if let d2 = try? circularQueue.dequeue() { print("Dequeued element: \(d2)") }
print(circularQueue)
try? circularQueue.enqueue(5)
print(circularQueue)


// --- Implementations ---

class Queue<T>: CustomStringConvertible {
    private var elements: [T] = []

    // Enqueue an element to the queue
    func enqueue(_ element: T) {
        elements.append(element)
    }

    // Add multiple elements
    func addAll(_ elements: [T]) {
        self.elements.append(contentsOf: elements)
    }

    // Dequeue an element from the queue
    func dequeue() throws -> T {
        if isEmpty { throw QueueError.empty }
        return elements.removeFirst()
    }

    // Get the front element of the queue without removing it
    func peek() throws -> T {
        if isEmpty { throw QueueError.empty }
        return elements.first!
    }

    // Check if the queue is empty
    var isEmpty: Bool {
        return elements.isEmpty
    }

    // Get the size of the queue
    var size: Int {
        return elements.count
    }

    var description: String {
        return "\(elements)"
    }
}

class QueueCircular<T>: CustomStringConvertible {
    private let capacity: Int
    private let defaultValue: T
    private var elements: [T]
    private var front = 0
    private var rear = 0
    private var size = 0

    init(capacity: Int, defaultValue: T) {
        self.capacity = capacity
        self.defaultValue = defaultValue
        self.elements = Array(repeating: defaultValue, count: capacity)
    }

    var isEmpty: Bool { return size == 0 }
    var isFull: Bool { return size == capacity }
    var length: Int { return size }

    func enqueue(_ element: T) throws {
        if isFull { throw QueueError.full }

        elements[rear] = element
        rear = (rear + 1) % capacity
        size += 1
    }

    func dequeue() throws -> T {
        if isEmpty { throw QueueError.empty }

        let element = elements[front]
        elements[front] = defaultValue
        front = (front + 1) % capacity
        size -= 1

        return element
    }

    func peek() throws -> T {
        if isEmpty { throw QueueError.empty }
        return elements[front]
    }

    var description: String {
        return "\(elements)"
    }
}

enum QueueError: Error {
    case empty
    case full
}