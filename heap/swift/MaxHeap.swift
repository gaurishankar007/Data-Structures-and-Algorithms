
import Foundation

class MaxHeap {
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
        while currentIndex > 0 && heap[currentIndex] > heap[parentIndex(currentIndex)] {
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
        var largest = index
        let leftIndex = leftChildIndex(index)
        let rightIndex = rightChildIndex(index)

        if leftIndex < heap.count && heap[leftIndex] > heap[largest] {
            largest = leftIndex
        }

        if rightIndex < heap.count && heap[rightIndex] > heap[largest] {
            largest = rightIndex
        }

        if largest != index {
            swap(index, largest)
            bubbleDown(largest)
        }
    }

    // Extract the maximum element from the heap
    func extractMax() -> Int {
        if heap.isEmpty {
            fatalError("Heap is empty")
        }
        let max = heap[0]
        heap[0] = heap[heap.count - 1]
        heap.removeLast()
        bubbleDown(0)
        return max
    }

    // Get the maximum element from the heap without removing it
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
let maxHeap = MaxHeap()
maxHeap.insert(10)
maxHeap.insert(4)
maxHeap.insert(6)
maxHeap.insert(3)
maxHeap.insert(8)

print("Maximum element in the heap: \(maxHeap.peek())")

while !maxHeap.isEmpty() {
    print("Extracted max element: \(maxHeap.extractMax())")
}
