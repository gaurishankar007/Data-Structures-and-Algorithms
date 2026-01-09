import Foundation

class CustomArray<T> {
    private var length: Int
    private var data: [Int: T]

    init() {
        self.length = 0
        self.data = [:]
    }

    func get(index: Int) -> T? {
        return data[index]
    }

    func push(item: T) -> Int {
        data[length] = item
        length += 1
        return length
    }

    func pop() -> T? {
        if length == 0 {
            return nil
        }
        let lastItem = data[length - 1]
        data.removeValue(forKey: length - 1)
        length -= 1
        return lastItem
    }

    func delete(at index: Int) -> T? {
        let item = data[index]
        shiftItems(index: index)
        return item
    }
    
    func insert(at index: Int, item: T) -> Int {
        shiftItemsForInsert(index: index)
        data[index] = item
        length += 1
        return length
    }

    private func shiftItems(index: Int) {
        for i in index..<(length - 1) {
            data[i] = data[i + 1]
        }
        data.removeValue(forKey: length - 1)
        length -= 1
    }
    
    private func shiftItemsForInsert(index: Int) {
        // Must iterate backwards to avoid overwriting
        for i in stride(from: length, to: index, by: -1) {
            data[i] = data[i - 1]
        }
    }

    func printArray() {
        var elements: [T] = []
        for i in 0..<length {
            if let val = data[i] {
                elements.append(val)
            }
        }
        print(elements)
    }
}

// Example Usage
let myArray = CustomArray<String>()
_ = myArray.push(item: "hi")
_ = myArray.push(item: "you")
_ = myArray.push(item: "!")
_ = myArray.pop()
_ = myArray.delete(at: 0)
_ = myArray.push(item: "there")
_ = myArray.insert(at: 1, item: "nice")
myArray.printArray() // Expect: ["you", "nice", "there"]
