import Foundation

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

print("Breadth First Search starting from vertex 0:")
graph.breadthFirstSearch(0)

class Graph {
    var adjacencyList: [Int: [Int]] = [:]

    // Add a vertex to the graph
    func addVertex(_ vertex: Int) {
        adjacencyList[vertex] = []
    }

    // Add an edge between two vertices
    func addEdge(_ source: Int, _ destination: Int) {
        adjacencyList[source]?.append(destination)
    }

    // Perform a breadth-first search starting from the given vertex
    func breadthFirstSearch(_ startVertex: Int) {
        var visited: Set<Int> = []
        var queue: [Int] = []

        visited.insert(startVertex)
        queue.append(startVertex)

        // While there are vertices in the queue
        while !queue.isEmpty {
            let currentVertex = queue.removeFirst()
            print(currentVertex)

            for neighbor in adjacencyList[currentVertex] ?? [] {
                if !visited.contains(neighbor) {
                    visited.insert(neighbor)
                    queue.append(neighbor)
                }
            }
        }
    }
}