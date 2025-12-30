// --- Implementation ---

class Graph2 {
  adjacencyList: Map<number, number[]> = new Map();

  // Add a vertex to the graph
  addVertex(vertex: number): void {
    this.adjacencyList.set(vertex, []);
  }

  // Add an edge between two vertices
  addEdge(source: number, destination: number): void {
    this.adjacencyList.get(source)?.push(destination);
  }

  // Perform a breadth-first search starting from the given vertex
  breadthFirstSearch(startVertex: number): void {
    const visited: Set<number> = new Set();
    const queue: number[] = [];

    visited.add(startVertex);
    queue.push(startVertex);

    // While there are vertices in the queue
    while (queue.length > 0) {
      const currentVertex = queue.shift()!;
      console.log(currentVertex);

      for (const neighbor of this.adjacencyList.get(currentVertex) || []) {
        if (!visited.has(neighbor)) {
          visited.add(neighbor);
          queue.push(neighbor);
        }
      }
    }
  }
}

// Example Usage
const graph2 = new Graph2();

graph2.addVertex(0);
graph2.addVertex(1);
graph2.addVertex(2);
graph2.addVertex(3);
graph2.addVertex(4);

graph2.addEdge(0, 1);
graph2.addEdge(0, 2);
graph2.addEdge(1, 3);
graph2.addEdge(2, 4);

console.log("Breadth First Search starting from vertex 0:");
graph2.breadthFirstSearch(0);
