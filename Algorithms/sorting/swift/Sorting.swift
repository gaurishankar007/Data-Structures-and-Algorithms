import Foundation

print("--- Basic List Sorting ---")

// 📌 How Swift Sorting Works
// Swift's .sort() sorts the collection in place (mutating).
// .sorted() returns a new sorted collection (non-mutating).
// It takes a closure (a, b) -> Bool
// Returns true: a comes before b
// Returns false: a comes after b

// 🔁 Example:
// var numbers = [5, 2, 9]
// numbers.sort { $0 < $1 } // [2, 5, 9] // Ascending
// numbers.sort { $0 > $1 } // [9, 5, 2] // Descending

// 1. Numbers
var numbers = [5, 2, 9, 1, 5]

// Sorts in ascending order by default
numbers.sort()
print("Sorted numbers (Ascending): \(numbers)") // [1, 2, 5, 5, 9]

// Sort in descending order using a custom comparator
// { $0 > $1 } returns true if the first element is greater than the second.
numbers.sort(by: >)
print("Sorted numbers (Descending): \(numbers)") // [9, 5, 5, 2, 1]

// 2. Strings
var fruits = ["banana", "apple", "cherry"]
fruits.sort()
print("Sorted fruits: \(fruits)") // ["apple", "banana", "cherry"]

print("\n--- Custom Object Sorting ---")

// 3. Custom Objects
struct Person: CustomStringConvertible {
    let name: String
    let age: Int

    var description: String {
        return "\(name) (\(age))"
    }
}

var people = [
    Person(name: "Alice", age: 30),
    Person(name: "Bob", age: 25),
    Person(name: "Charlie", age: 35)
]

// Sort by age (Ascending)
// We compare the 'age' property of person '$0' with person '$1'
people.sort { $0.age < $1.age }
print("Sorted people by age: \(people)")

// Sort by name (Descending)
people.sort { $0.name > $1.name }
print("Sorted people by name (desc): \(people)")

print("\n--- Null-safe Sorting ---")

// 4. Null-safe Sorting
var data: [String?] = ["b", nil, "a"]

// We must handle nils because comparison operators cannot be called on nil directly in this context without unwrapping.
// Here we treat nil as an empty string for comparison purposes.
data.sort { ($0 ?? "") < ($1 ?? "") }
// Note: Swift prints Optionals wrapped in "Optional(...)".
print("Sorted with nulls: \(data)")

print("\n--- Map Sorting ---")

// 5. Map Sorting
let map = ["b": 1, "a": 2, "c": 3]

// Sort by Key
// Dictionaries are inherently unordered in Swift.
// To "sort" a map, we usually convert it to a list of tuples (key-value pairs) and sort that list.
let sortedByKey = map.sorted { $0.key < $1.key }
print("Map sorted by key: \(sortedByKey)")

// Sort by Value
let sortedByValue = map.sorted { $0.value < $1.value }
print("Map sorted by value: \(sortedByValue)")