class Graph3 {
  adjacencyList: Map<number, number[]> = new Map();

  constructor() {}

  // Add a vertex to the graph
  addVertex(vertex: number): void {
    this.adjacencyList.set(vertex, []);
  }

  // Add an edge between two vertices
  addEdge(source: number, destination: number): void {
    const neighbors = this.adjacencyList.get(source);
    if (neighbors) {
      neighbors.push(destination);
    }
  }

  // Perform a depth-first search starting from the given vertex
  depthFirstSearch(startVertex: number): void {
    const visited: Set<number> = new Set();
    this.depthFirstSearchRecursive(startVertex, visited);
  }

  // Recursive helper function for depthFirstSearch
  private depthFirstSearchRecursive(
    vertex: number,
    visited: Set<number>
  ): void {
    visited.add(vertex);
    console.log(vertex);

    const neighbors = this.adjacencyList.get(vertex) || [];
    for (const neighbor of neighbors) {
      if (!visited.has(neighbor)) {
        this.depthFirstSearchRecursive(neighbor, visited);
      }
    }
  }
}

// Usage Example
const graph3 = new Graph3();

graph3.addVertex(0);
graph3.addVertex(1);
graph3.addVertex(2);
graph3.addVertex(3);
graph3.addVertex(4);

graph3.addEdge(0, 1);
graph3.addEdge(0, 2);
graph3.addEdge(1, 3);
graph3.addEdge(2, 4);

console.log("Depth First Search starting from vertex 0:");
graph3.depthFirstSearch(0);
