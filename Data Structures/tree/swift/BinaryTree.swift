import Foundation

print("--- Binary Tree ---")
let tree = BinaryTree()

// Insert elements into the binary tree
tree.insert(5)
tree.insert(3)
tree.insert(8)
tree.insert(1)
tree.insert(4)
tree.insert(7)
tree.insert(9)

// Perform inOrder traversal to print elements
//    5
//  3   8
// 1 4 7 9
print("InOrder traversal of the binary tree:")
tree.inOrderTraversal(tree.root)


// --- Implementations ---

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int) {
        self.val = val
    }
}

class BinaryTree {
    var root: TreeNode?

    // Function to insert a value into the binary tree
    func insert(_ value: Int) {
        root = insertRecursive(root, value)
    }

    private func insertRecursive(_ root: TreeNode?, _ value: Int) -> TreeNode {
        guard let root = root else {
            return TreeNode(value)
        }

        if root.left == nil {
            root.left = insertRecursive(root.left, value)
        } else if root.right == nil {
            root.right = insertRecursive(root.right, value)
        } else {
            // Choose either left or right subtree randomly to insert the value
            if Bool.random() {
                root.left = insertRecursive(root.left, value)
            } else {
                root.right = insertRecursive(root.right, value)
            }
        }
        return root
    }

    // Function to perform inOrder traversal of the binary tree
    func inOrderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }
        inOrderTraversal(root.left)
        print(root.val)
        inOrderTraversal(root.right)
    }
}