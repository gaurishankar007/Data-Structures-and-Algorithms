
import Foundation

class Graph {
    var adjacencyMatrix: [[Int]]

    init(vertices: Int) {
        // Initialize the adjacency matrix with all cells set to 0
        adjacencyMatrix = Array(repeating: Array(repeating: 0, count: vertices), count: vertices)
    }

    // Function to add an edge between two vertices
    func addEdge(_ source: Int, _ destination: Int) {
        adjacencyMatrix[source][destination] = 1
        adjacencyMatrix[destination][source] = 1 // Assuming an undirected graph
    }

    // Function to print the adjacency matrix
    func printGraph() {
        for row in adjacencyMatrix {
            print(row)
        }
    }
}

// Create a graph with 5 vertices
let graph = Graph(vertices: 5)

// Add edges to the graph
graph.addEdge(0, 1)
graph.addEdge(0, 4)
graph.addEdge(1, 2)
graph.addEdge(1, 3)
graph.addEdge(1, 4)
graph.addEdge(2, 3)
graph.addEdge(3, 4)

// Print the adjacency matrix
graph.printGraph()
