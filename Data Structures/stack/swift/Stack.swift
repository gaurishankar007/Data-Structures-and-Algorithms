import Foundation

class Stack<T> {
    private var size: Int
    private var stack: [T] = []
    
    init(size: Int) {
        self.size = size
    }
    
    enum StackError: Error {
        case overflow
        case underflow
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }

    var isFull: Bool {
        return stack.count >= size
    }
    
    var length: Int {
        return stack.count
    }
    
    func push(item: T) throws {
        if isFull {
            throw StackError.overflow
        }
        stack.append(item)
    }
    
    func pop() throws -> T {
        if isEmpty {
            throw StackError.underflow
        }
        return stack.removeLast()
    }
    
    func peek() throws -> T {
        if isEmpty {
            throw StackError.underflow
        }
        return stack.last!
    }
}

let stack = Stack<Int>(size: 8)
try? stack.push(item: 4)
try? stack.push(item: 8)
try? stack.push(item: 16)
print(try! stack.peek())
print(try! stack.pop())
print(stack.length)
