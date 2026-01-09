// --- Implementations ---

class TreeNode {
  val: number;
  left: TreeNode | null = null;
  right: TreeNode | null = null;

  constructor(val: number) {
    this.val = val;
  }
}

class BinaryTree {
  root: TreeNode | null = null;

  // Function to insert a value into the binary tree
  insert(value: number): void {
    this.root = this.insertRecursive(this.root, value);
  }

  private insertRecursive(root: TreeNode | null, value: number): TreeNode {
    if (root === null) {
      return new TreeNode(value);
    }

    if (root.left === null) {
      root.left = this.insertRecursive(root.left, value);
    } else if (root.right === null) {
      root.right = this.insertRecursive(root.right, value);
    } else {
      // Choose either left or right subtree randomly to insert the value
      if (Math.random() < 0.5) {
        root.left = this.insertRecursive(root.left, value);
      } else {
        root.right = this.insertRecursive(root.right, value);
      }
    }
    return root;
  }

  // Function to perform inOrder traversal of the binary tree
  inOrderTraversal(root: TreeNode | null): void {
    if (root !== null) {
      this.inOrderTraversal(root.left);
      console.log(root.val);
      this.inOrderTraversal(root.right);
    }
  }
}

// Example Usage
console.log("--- Binary Tree ---");
const tree = new BinaryTree();

// Insert elements into the binary tree
tree.insert(5);
tree.insert(3);
tree.insert(8);
tree.insert(1);
tree.insert(4);
tree.insert(7);
tree.insert(9);

// Perform inOrder traversal to print elements
//    5
//  3   8
// 1 4 7 9
console.log("InOrder traversal of the binary tree:");
tree.inOrderTraversal(tree.root);
