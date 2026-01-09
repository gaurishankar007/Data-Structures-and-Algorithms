
import Foundation

// Create a hash map
var hashMap: [String: Int] = [:]

// Add key-value pairs to the hash map
hashMap["apple"] = 1
hashMap["banana"] = 2
hashMap["cherry"] = 3

// Print the hash map
print(hashMap) // ["apple": 1, "cherry": 3, "banana": 2] (Order may vary)

// Access a value using a key
print(hashMap["banana"] ?? "nil") // Optional(2) or 2

// Update a value using a key
hashMap["banana"] = 4
print(hashMap) // ["apple": 1, "cherry": 3, "banana": 4]

// Remove a key-value pair
hashMap.removeValue(forKey: "banana")
print(hashMap) // ["apple": 1, "cherry": 3]

// Check if a key exists
print(hashMap.keys.contains("apple")) // true
print(hashMap.keys.contains("banana")) // false

// Check if a value exists
print(hashMap.values.contains(1)) // true
print(hashMap.values.contains(2)) // false

// Get the number of key-value pairs
print(hashMap.count) // 2

// Get all keys
print(hashMap.keys)

// Get all values
print(hashMap.values)

// Clear the hash map
hashMap.removeAll()
print(hashMap) // [:]

// Create a hash set
var hashSet: Set<Int> = []

// Add elements to the hash set
hashSet.insert(1)
hashSet.insert(2)
hashSet.insert(3)

// Print the hash set
print(hashSet) // [2, 3, 1] (Order may vary)

// Check if an element exists
print(hashSet.contains(2)) // true
print(hashSet.contains(4)) // false

// Remove an element
hashSet.remove(2)
print(hashSet) // [3, 1]

// Get the number of elements
print(hashSet.count) // 2

// Clear the hash set
hashSet.removeAll()
print(hashSet) // []
