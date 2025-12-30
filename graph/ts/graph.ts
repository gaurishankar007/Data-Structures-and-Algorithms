class Graph4 {
  adjacencyMatrix: number[][];

  constructor(vertices: number) {
    // Initialize the adjacency matrix with all cells set to 0
    this.adjacencyMatrix = Array.from({ length: vertices }, () =>
      Array(vertices).fill(0)
    );
  }

  // Function to add an edge between two vertices
  addEdge(source: number, destination: number): void {
    this.adjacencyMatrix[source][destination] = 1;
    this.adjacencyMatrix[destination][source] = 1; // Assuming an undirected graph
  }

  // Function to print the adjacency matrix
  printGraph(): void {
    for (let i = 0; i < this.adjacencyMatrix.length; i++) {
      console.log(this.adjacencyMatrix[i]);
    }
  }
}

// Create a graph with 5 vertices
const graph4 = new Graph4(5);

// Add edges to the graph
graph4.addEdge(0, 1);
graph4.addEdge(0, 4);
graph4.addEdge(1, 2);
graph4.addEdge(1, 3);
graph4.addEdge(1, 4);
graph4.addEdge(2, 3);
graph4.addEdge(3, 4);

// Print the adjacency matrix
graph4.printGraph();
