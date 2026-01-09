
import Foundation

class MinHeap {
    private var heap: [Int] = []

    init() {}

    // Get the parent index of a given index
    private func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }

    // Get the left child index of a given index
    private func leftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }

    // Get the right child index of a given index
    private func rightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }

    // Swap two elements in the heap
    private func swap(_ index1: Int, _ index2: Int) {
        let temp = heap[index1]
        heap[index1] = heap[index2]
        heap[index2] = temp
    }

    // Bubble up a newly added element to maintain heap property
    private func bubbleUp(_ index: Int) {
        var currentIndex = index
        while currentIndex > 0 && heap[currentIndex] < heap[parentIndex(currentIndex)] {
            swap(currentIndex, parentIndex(currentIndex))
            currentIndex = parentIndex(currentIndex)
        }
    }

    // Insert a new element into the heap
    func insert(_ value: Int) {
        heap.append(value)
        bubbleUp(heap.count - 1)
    }

    // Bubble down an element to maintain heap property after removal
    private func bubbleDown(_ index: Int) {
        var smallest = index
        let leftIndex = leftChildIndex(index)
        let rightIndex = rightChildIndex(index)

        if leftIndex < heap.count && heap[leftIndex] < heap[smallest] {
            smallest = leftIndex
        }

        if rightIndex < heap.count && heap[rightIndex] < heap[smallest] {
            smallest = rightIndex
        }

        if smallest != index {
            swap(index, smallest)
            bubbleDown(smallest)
        }
    }

    // Extract the minimum element from the heap
    func extractMin() -> Int {
        if heap.isEmpty {
            fatalError("Heap is empty")
        }
        let min = heap[0]
        heap[0] = heap[heap.count - 1]
        heap.removeLast()
        bubbleDown(0)
        return min
    }

    // Get the minimum element from the heap without removing it
    func peek() -> Int {
        if heap.isEmpty {
            fatalError("Heap is empty")
        }
        return heap[0]
    }

    // Check if the heap is empty
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
}

// Usage Example
let minHeap = MinHeap()
minHeap.insert(10)
minHeap.insert(4)
minHeap.insert(6)
minHeap.insert(3)
minHeap.insert(8)

print("Minimum element in the heap: \(minHeap.peek())")

while !minHeap.isEmpty() {
    print("Extracted min element: \(minHeap.extractMin())")
}
