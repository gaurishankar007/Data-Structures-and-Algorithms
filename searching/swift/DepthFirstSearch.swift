
import Foundation

class Graph {
    var adjacencyList: [Int: [Int]] = [:]

    init() {}

    // Add a vertex to the graph
    func addVertex(_ vertex: Int) {
        adjacencyList[vertex] = []
    }

    // Add an edge between two vertices
    func addEdge(_ source: Int, _ destination: Int) {
        adjacencyList[source]?.append(destination)
    }

    // Perform a depth-first search starting from the given vertex
    func depthFirstSearch(_ startVertex: Int) {
        var visited: Set<Int> = []
        depthFirstSearchRecursive(startVertex, &visited)
    }

    // Recursive helper function for depthFirstSearch
    private func depthFirstSearchRecursive(_ vertex: Int, _ visited: inout Set<Int>) {
        visited.insert(vertex)
        print(vertex)

        if let neighbors = adjacencyList[vertex] {
            for neighbor in neighbors {
                if !visited.contains(neighbor) {
                    depthFirstSearchRecursive(neighbor, &visited)
                }
            }
        }
    }
}

// Usage Example
let graph = Graph()

graph.addVertex(0)
graph.addVertex(1)
graph.addVertex(2)
graph.addVertex(3)
graph.addVertex(4)

graph.addEdge(0, 1)
graph.addEdge(0, 2)
graph.addEdge(1, 3)
graph.addEdge(2, 4)

print("Depth First Search starting from vertex 0:")
graph.depthFirstSearch(0)
