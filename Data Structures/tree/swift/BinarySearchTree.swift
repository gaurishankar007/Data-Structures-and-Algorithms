import Foundation

print("--- Binary Search Tree ---")
let tree = BinarySearchTree()

// Insert elements into the binary search tree
tree.insert(5)
tree.insert(3)
tree.insert(8)
tree.insert(1)
tree.insert(4)
tree.insert(7)
tree.insert(9)

// Perform inOrder traversal to print elements in sorted order
//    5
//  3   8
// 1 4 7 9
print("InOrder traversal of the binary search tree:")
tree.inOrderTraversal(tree.root)

// Search for a value in the binary search tree
let target = 4
let found = tree.search(target)
print("Value \(target) found in the binary search tree: \(found)")


// --- Implementations ---

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int) {
        self.val = val
    }
}

class BinarySearchTree {
    var root: TreeNode?

    // Function to insert a value into the binary search tree
    func insert(_ value: Int) {
        root = insertRecursive(root, value)
    }

    private func insertRecursive(_ root: TreeNode?, _ value: Int) -> TreeNode {
        guard let root = root else {
            return TreeNode(value)
        }

        if value < root.val {
            root.left = insertRecursive(root.left, value)
        } else if value > root.val {
            root.right = insertRecursive(root.right, value)
        }

        return root
    }

    // Function to perform inOrder traversal of the binary search tree
    func inOrderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }
        inOrderTraversal(root.left)
        print(root.val)
        inOrderTraversal(root.right)
    }

    // Function to search for a value in the binary search tree
    func search(_ value: Int) -> Bool {
        return searchRecursive(root, value)
    }

    private func searchRecursive(_ root: TreeNode?, _ value: Int) -> Bool {
        guard let root = root else {
            return false
        }

        if root.val == value {
            return true
        } else if value < root.val {
            return searchRecursive(root.left, value)
        } else {
            return searchRecursive(root.right, value)
        }
    }
}