void main() {
  Graph graph = Graph();

  graph.addVertex(0);
  graph.addVertex(1);
  graph.addVertex(2);
  graph.addVertex(3);
  graph.addVertex(4);

  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 3);
  graph.addEdge(2, 4);

  print("Depth First Search starting from vertex 0:");
  graph.depthFirstSearch(0);
}

class Graph {
  Map<int, List<int>> adjacencyList = {};

  Graph();

  // Add a vertex to the graph
  void addVertex(int vertex) {
    adjacencyList[vertex] = [];
  }

  // Add an edge between two vertices
  void addEdge(int source, int destination) {
    adjacencyList[source]?.add(destination);
  }

  // Perform a depth-first search starting from the given vertex
  void depthFirstSearch(int startVertex) {
    Set<int> visited = {};
    depthFirstSearchRecursive(startVertex, visited);
  }

  // Recursive helper function for depthFirstSearch
  void depthFirstSearchRecursive(int vertex, Set<int> visited) {
    visited.add(vertex);
    print(vertex);

    for (int neighbor in adjacencyList[vertex] ?? []) {
      if (!visited.contains(neighbor)) {
        depthFirstSearchRecursive(neighbor, visited);
      }
    }
  }
}
