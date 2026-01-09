void main() {
  // Create a hash map
  var hashMap = <String, int>{};

  // Add key-value pairs to the hash map
  hashMap['apple'] = 1;
  hashMap['banana'] = 2;
  hashMap['cherry'] = 3;

  // Print the hash map
  print(hashMap); // {apple: 1, banana: 2, cherry: 3}

  // Access a value using a key
  print(hashMap['banana']); // 2

  // Update a value using a key
  hashMap['banana'] = 4;
  print(hashMap); // {apple: 1, banana: 4, cherry: 3}

  // Remove a key-value pair
  hashMap.remove('banana');
  print(hashMap); // {apple: 1, cherry: 3}

  // Check if a key exists
  print(hashMap.containsKey('apple')); // true
  print(hashMap.containsKey('banana')); // false

  // Check if a value exists
  print(hashMap.containsValue(1)); // true
  print(hashMap.containsValue(2)); // false

  // Get the number of key-value pairs
  print(hashMap.length); // 2

  // Get all keys
  print(hashMap.keys); // (apple, cherry)

  // Get all values
  print(hashMap.values); // (1, 3)

  // Clear the hash map
  hashMap.clear();
  print(hashMap); // {

  // Create a hash set
  var hashSet = <int>{};

  // Add elements to the hash set
  hashSet.add(1);
  hashSet.add(2);
  hashSet.add(3);

  // Print the hash set
  print(hashSet); // {1, 2, 3}

  // Check if an element exists
  print(hashSet.contains(2)); // true
  print(hashSet.contains(4)); // false

  // Remove an element
  hashSet.remove(2);
  print(hashSet); // {1, 3}

  // Get the number of elements
  print(hashSet.length); // 2

  // Clear the hash set
  hashSet.clear();
  print(hashSet); // {}
}
