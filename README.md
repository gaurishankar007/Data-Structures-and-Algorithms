# Data Structures and Algorithms (DSA) 🌈

This project provides guidelines for data structures and algorithms (DSA) with a strong focus on passing coding interviews for software engineering jobs.

## Big O

`Big O` notation in DSA is a way to measure the efficiency of algorithms.
It provides a standardized method to express how the time or space taken by an algorithm grows with the size of the input.

- `Time Complexity` Describes how the runtime of an algorithm scales with input size.
  - `O(1)` -> Constant time
  - `O(log n)` -> Logarithmic time
  - `O(n)` -> Linear time
  - `O(n^2), O(n^3)` -> Polynomial time
  - `O(2^n), O(n!)` -> Exponential time
- `Space Complexity` Describes how the memory usage of an algorithm scales with input size.
  - `O(1)` -> Constant space
  - `O(n)` -> Linear space
  - `O(n^2), O(n^3)` -> Polynomial space
  - `O(log n), O(n log n)` -> Logarithmic or linearithmic space

Understanding `Big O` helps in choosing efficient algorithms and data structures,
crucial for optimizing performance, especially with large datasets or performance-critical applications.

## Topics

- `Stacks`
  - A stack is a collection of elements that allows adding and removing items only from one end, known as the top.
  - It follows the Last-In, First-Out (LIFO) principle, meaning the last element added is the first one to be removed.
  - ![Stack Image](https://www.techgig.com/files/nicUploads/95261623711348.png)
- `Queues`
  - A queue is a data structure that follows the First-In, First-Out (FIFO) principle, where elements are added at one end, known as the rear, and removed from the other end, known as the front.
  - It maintains the order in which elements are added, ensuring that the oldest element is dequeued first.
  - ![Queue Image](https://media.geeksforgeeks.org/wp-content/cdn-uploads/20221213113312/Queue-Data-Structures.png)
  - ![Circular Queue Image](https://media.geeksforgeeks.org/wp-content/uploads/20210208122704/cq2.jpeg)
- `Linked Lists`
  - A linked list is a linear data structure consisting of nodes where each node contains a data element and a reference (or pointer) to the next node in the sequence.
  - Unlike arrays, linked lists do not have a fixed size, and elements can be efficiently inserted or removed from any position within the list.
  - ![Linked List Image](https://media.geeksforgeeks.org/wp-content/uploads/20220712172013/Singlelinkedlist.png)
- `Hashing`
  - Hashing involves efficiently mapping data elements to unique keys using a hash function, allowing for fast retrieval, insertion, and deletion of values in data structures like hash tables.
  - It facilitates quick access to stored information by converting keys into indices, reducing search time complexity to nearly constant time on average.
  - ![Hashing Image](https://media.geeksforgeeks.org/wp-content/cdn-uploads/20221220111537/ComponentsofHashing.png)
- `Trees`
  - `Binary Tree` A binary tree is a tree in which each node can have at most two children, referred to as the left child and the right child.
  - `Binary Search Tree` A binary search tree is a binary tree in which the value of each node in the left subtree is less than the value of the node, and the value of each node in the right subtree is greater than the value of the node.
  - ![Binary Search Tree Image](https://www.guru99.com/images/1/020820_0600_BinarySearc1.png)
- `Graphs`
  - A graph is a data structure that consists of a set of vertices (nodes) and a set of edges connecting these vertices.
  - It's used to represent relationships or connections between objects, with edges typically denoting pairwise relationships or interactions.
  - ![Graph Image](https://www.simplilearn.com/ice9/free_resources_article_thumb/Graph%20Data%20Structure%20-%20Soni/add-vertex-operation-on-graph-in-data-structure.png)
- `Heaps`
  - A heap is a specialized tree-based data structure that satisfies the heap property.
  - There are two main types of heaps: min-heap and max-heap.
  - `Min-Heap`
    - In a min-heap, the key of each node is less than or equal to the keys of its children.
    - The minimum element is at the root, making it efficient to find the minimum element quickly.
  - `Max-Heap`
    - In a max-heap, the key of each node is greater than or equal to the keys of its children.
    - The maximum element is at the root, facilitating quick retrieval of the maximum element.
  - ![Min/Max Heap Image](https://www.sahinarslan.tech/static/33612c8f7085780219124e552494212f/e46b2/heap-binary-heap-anatomy.webp)
- `Greedy`
  - A greedy algorithm decides what to do in each step, only based on the current situation, without a thought of how the total problem looks like.
  - In other words, a greedy algorithm makes the locally optimal choice in each step, hoping to find the global optimum solution in the end.
  - ![Greedy Technique Image](https://cdn.botpenguin.com/assets/website/Greedy_Algorithm_19db670e50.webp)
- `Searching`
  - `Binary Search`
    - Binary search is a divide-and-conquer algorithm that efficiently locates a target value within a sorted array by repeatedly dividing the search interval in half.
    - It achieves a logarithmic time complexity of O(log n), making it significantly faster than linear search for large datasets.
    - ![Binary Search Image](https://miro.medium.com/v2/resize:fit:1200/1*M8nxu1oYQy2vpWRjlVdXNA.png)
  - `Depth First Search (DFS)`
    - Depth-first search is a graph traversal algorithm that systematically explores the graph's branches, prioritizing depth over breadth, by visiting adjacent vertices recursively until it reaches a dead end.
    - ![Depth First Search Image](https://www.boardinfinity.com/blog/content/images/2022/10/9fa1119.jpg)
  - `Breadth First Search (BFS)`
    - Breadth-first search (BFS) is a graph traversal algorithm that systematically explores the neighbor vertices of a starting vertex before moving on to the next level of neighbors.
    - It prioritizes breadth over depth, visiting all vertices at a given distance from the starting vertex before proceeding to vertices farther away.
    - ![Breadth First Search Image](https://cdn.hackr.io/uploads/posts/attachments/41Y3Tl3kaPqGDVBPKFjJ1dYYrA33iss48iMklm7h.png)
  - BFS VS DFS
    - ![BFS VS DFS Image](<https://media.geeksforgeeks.org/wp-content/uploads/20240219134945/bfs-vs-dfs-(1).png>)
