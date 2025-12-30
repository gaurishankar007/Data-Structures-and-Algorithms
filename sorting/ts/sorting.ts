console.log("--- Basic Array Sorting ---");

// 📌 How JS/TS Sorting Works
// Array.prototype.sort() takes a comparator function (a, b) => ...
// Returns < 0: a comes before b
// Returns 0: a and b are equal
// Returns > 0: a comes after b

// 🔁 Example:
// const numbers = [5, 2, 9];
// numbers.sort((a, b) => a - b); // [2, 5, 9] // Ascending
// numbers.sort((a, b) => b - a); // [9, 5, 2] // Descending

// For strings, use localeCompare():
// 'a'.localeCompare('b'); // -1 ('a' < 'b')
// 'b'.localeCompare('a'); // 1 ('b' > 'a')

// 1. Numbers
const numbers: number[] = [5, 2, 9, 1, 5];

// Sorts in ascending order
// Note: Default .sort() in JS/TS converts elements to strings,
// so we must provide a comparator (a - b) for correct numeric sorting.
numbers.sort((a, b) => a - b);
console.log("Sorted numbers (Ascending):", numbers); // [1, 2, 5, 5, 9]

// Sort in descending order
numbers.sort((a, b) => b - a);
console.log("Sorted numbers (Descending):", numbers); // [9, 5, 5, 2, 1]

// 2. Strings
const fruits: string[] = ["banana", "apple", "cherry"];
fruits.sort(); // Default string comparison works fine here
console.log("Sorted fruits:", fruits); // [apple, banana, cherry]

console.log("\n--- Custom Object Sorting ---");

// 3. Custom Objects
class Person {
  constructor(public name: string, public age: number) {}
}

const people: Person[] = [
  new Person("Alice", 30),
  new Person("Bob", 25),
  new Person("Charlie", 35),
];

// Sort by age (Ascending)
people.sort((a, b) => a.age - b.age);
console.log("Sorted people by age:", people);

// Sort by name (Descending)
// localeCompare is useful for string comparison
people.sort((a, b) => b.name.localeCompare(a.name));
console.log("Sorted people by name (desc):", people);

console.log("\n--- Null-safe Sorting ---");

// 4. Null-safe Sorting
const data: (string | null)[] = ["b", null, "a"];

// Handle nulls by treating them as empty strings (or however you prefer)
data.sort((a, b) => {
  const valA = a ?? "";
  const valB = b ?? "";
  return valA.localeCompare(valB);
});
console.log("Sorted with nulls:", data); // [null, 'a', 'b']

console.log("\n--- Map Sorting ---");

// 5. Map Sorting
const map = new Map<string, number>([
  ["b", 1],
  ["a", 2],
  ["c", 3],
]);

// Sort by Key
// Maps preserve insertion order, so we convert to entries, sort, and rebuild the Map.
const sortedByKey = new Map(
  [...map.entries()].sort((a, b) => a[0].localeCompare(b[0]))
);
console.log("Map sorted by key:", sortedByKey);

// Sort by Value
const sortedByValue = new Map([...map.entries()].sort((a, b) => a[1] - b[1]));
console.log("Map sorted by value:", sortedByValue);
