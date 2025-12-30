void main() {
  // Create a graph with 5 vertices
  Graph graph = Graph(5);

  // Add edges to the graph
  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);

  // Print the adjacency matrix
  graph.printGraph();
}

class Graph {
  List<List<int>> adjacencyMatrix = [];

  Graph(int vertices) {
    // Initialize the adjacency matrix with all cells set to 0
    adjacencyMatrix = List.generate(vertices, (_) => List<int>.filled(vertices, 0));
  }

  // Function to add an edge between two vertices
  void addEdge(int source, int destination) {
    adjacencyMatrix[source][destination] = 1;
    adjacencyMatrix[destination][source] = 1; // Assuming an undirected graph
  }

  // Function to print the adjacency matrix
  void printGraph() {
    for (int i = 0; i < adjacencyMatrix.length; i++) {
      print(adjacencyMatrix[i]);
    }
  }
}
