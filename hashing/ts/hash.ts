// Create a hash map
const hashMap = new Map<string, number>();

// Add key-value pairs to the hash map
hashMap.set("apple", 1);
hashMap.set("banana", 2);
hashMap.set("cherry", 3);

// Print the hash map
console.log(hashMap); // Map(3) { 'apple' => 1, 'banana' => 2, 'cherry' => 3 }

// Access a value using a key
console.log(hashMap.get("banana")); // 2

// Update a value using a key
hashMap.set("banana", 4);
console.log(hashMap); // Map(3) { 'apple' => 1, 'banana' => 4, 'cherry' => 3 }

// Remove a key-value pair
hashMap.delete("banana");
console.log(hashMap); // Map(2) { 'apple' => 1, 'cherry' => 3 }

// Check if a key exists
console.log(hashMap.has("apple")); // true
console.log(hashMap.has("banana")); // false

// Check if a value exists
// Map doesn't have a direct containsValue method, so we iterate
console.log([...hashMap.values()].includes(1)); // true
console.log([...hashMap.values()].includes(2)); // false

// Get the number of key-value pairs
console.log(hashMap.size); // 2

// Get all keys
console.log(hashMap.keys()); // [Map Iterator] { 'apple', 'cherry' }

// Get all values
console.log(hashMap.values()); // [Map Iterator] { 1, 3 }

// Clear the hash map
hashMap.clear();
console.log(hashMap); // Map(0) {}

// Create a hash set
const hashSet = new Set<number>();

// Add elements to the hash set
hashSet.add(1);
hashSet.add(2);
hashSet.add(3);

// Print the hash set
console.log(hashSet); // Set(3) { 1, 2, 3 }

// Check if an element exists
console.log(hashSet.has(2)); // true
console.log(hashSet.has(4)); // false

// Remove an element
hashSet.delete(2);
console.log(hashSet); // Set(2) { 1, 3 }

// Get the number of elements
console.log(hashSet.size); // 2

// Clear the hash set
hashSet.clear();
console.log(hashSet); // Set(0) {}
