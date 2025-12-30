void main() {
  print('--- Basic List Sorting ---');

  // 📌 How Dart Sorting Works
  // Dart's .sort() takes a comparator function (a, b) => ...
  // Returns < 0: a comes before b
  // Returns 0: a and b are equal
  // Returns > 0: a comes after b

  // 🔁 Example:
  // List<int> numbers = [5, 2, 9];
  // numbers.sort((a, b) => a.compareTo(b)); // [2, 5, 9] // Ascending
  // numbers.sort((a, b) => b.compareTo(a)); // [9, 5, 2] // Descending

  // compareTo() is a method available on types like int, String, etc.:
  // 5.compareTo(3); // 1 (5 > 3)
  // 2.compareTo(5); // -1 (2 < 5)

  // 1. Numbers
  List<int> numbers = [5, 2, 9, 1, 5];

  // Sorts in ascending order by default using the default comparator
  numbers.sort();
  print('Sorted numbers (Ascending): $numbers'); // [1, 2, 5, 5, 9]

  // Sort in descending order using a custom comparator
  // (a, b) => b.compareTo(a) returns > 0 if b > a, effectively swapping them for descending order.
  numbers.sort((a, b) => b.compareTo(a));
  print('Sorted numbers (Descending): $numbers'); // [9, 5, 5, 2, 1]

  // 2. Strings
  List<String> fruits = ['banana', 'apple', 'cherry'];
  fruits.sort();
  print('Sorted fruits: $fruits'); // [apple, banana, cherry]

  print('\n--- Custom Object Sorting ---');

  // 3. Custom Objects
  List<Person> people = [
    Person('Alice', 30),
    Person('Bob', 25),
    Person('Charlie', 35),
  ];

  // Sort by age (Ascending)
  // We compare the 'age' property of person 'a' with person 'b'
  people.sort((a, b) => a.age.compareTo(b.age));
  print('Sorted people by age: $people');

  // Sort by name (Descending)
  people.sort((a, b) => b.name.compareTo(a.name));
  print('Sorted people by name (desc): $people');

  print('\n--- Null-safe Sorting ---');

  // 4. Null-safe Sorting
  List<String?> data = ['b', null, 'a'];

  // We must handle nulls because compareTo cannot be called on null.
  // Here we treat null as an empty string for comparison purposes.
  data.sort((a, b) => (a ?? '').compareTo(b ?? ''));
  print('Sorted with nulls: $data'); // [null, a, b]

  print('\n--- Map Sorting ---');

  // 5. Map Sorting
  Map<String, int> map = {'b': 1, 'a': 2, 'c': 3};

  // Sort by Key
  // Maps are inherently unordered (though LinkedHashMap maintains insertion order).
  // To "sort" a map, we usually convert it to a list of entries, sort that list, and rebuild the map.
  var sortedByKey = Map.fromEntries(
    map.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
  );
  print('Map sorted by key: $sortedByKey');

  // Sort by Value
  var sortedByValue = Map.fromEntries(
    map.entries.toList()..sort((a, b) => a.value.compareTo(b.value)),
  );
  print('Map sorted by value: $sortedByValue');
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() => '$name ($age)';
}
