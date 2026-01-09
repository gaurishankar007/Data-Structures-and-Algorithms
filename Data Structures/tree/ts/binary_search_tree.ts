// --- Implementations ---

class TreeNode1 {
  val: number;
  left: TreeNode1 | null = null;
  right: TreeNode1 | null = null;

  constructor(val: number) {
    this.val = val;
  }
}

class BinarySearchTree {
  root: TreeNode1 | null = null;

  // Function to insert a value into the binary search tree
  insert(value: number): void {
    this.root = this.insertRecursive(this.root, value);
  }

  private insertRecursive(root: TreeNode1 | null, value: number): TreeNode1 {
    if (root === null) {
      return new TreeNode1(value);
    }

    if (value < root.val) {
      root.left = this.insertRecursive(root.left, value);
    } else if (value > root.val) {
      root.right = this.insertRecursive(root.right, value);
    }

    return root;
  }

  // Function to perform inOrder traversal of the binary search tree
  inOrderTraversal(root: TreeNode1 | null): void {
    if (root !== null) {
      this.inOrderTraversal(root.left);
      console.log(root.val);
      this.inOrderTraversal(root.right);
    }
  }

  // Function to search for a value in the binary search tree
  search(value: number): boolean {
    return this.searchRecursive(this.root, value);
  }

  private searchRecursive(root: TreeNode1 | null, value: number): boolean {
    if (root === null) {
      return false;
    }

    if (root.val === value) {
      return true;
    } else if (value < root.val) {
      return this.searchRecursive(root.left, value);
    } else {
      return this.searchRecursive(root.right, value);
    }
  }
}

// Example Usage
console.log("--- Binary Search Tree ---");
const tree1 = new BinarySearchTree();

// Insert elements into the binary search tree
tree1.insert(5);
tree1.insert(3);
tree1.insert(8);
tree1.insert(1);
tree1.insert(4);
tree1.insert(7);
tree1.insert(9);

// Perform inOrder traversal to print elements in sorted order
//    5
//  3   8
// 1 4 7 9
console.log("InOrder traversal of the binary search tree:");
tree1.inOrderTraversal(tree1.root);

// Search for a value in the binary search tree
const target = 4;
const found = tree1.search(target);
console.log(`Value ${target} found in the binary search tree: ${found}`);
