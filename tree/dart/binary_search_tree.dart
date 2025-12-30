void main() {
  BinarySearchTree tree = BinarySearchTree();

  // Insert elements into the binary search tree
  tree.insert(5);
  tree.insert(3);
  tree.insert(8);
  tree.insert(1);
  tree.insert(4);
  tree.insert(7);
  tree.insert(9);

  // Perform inOrder traversal to print elements in sorted order
  //    5
  //  3   8
  // 1 4 7 9
  print("InOrder traversal of the binary search tree:");
  tree.inOrderTraversal(tree.root);

  // Search for a value in the binary search tree
  int target = 4;
  bool found = tree.search(target);
  print("Value $target found in the binary search tree: $found");
}

class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinarySearchTree {
  TreeNode? root;

  BinarySearchTree();

  // Function to insert a value into the binary search tree
  void insert(int value) {
    root = _insertRecursive(root, value);
  }

  TreeNode _insertRecursive(TreeNode? root, int value) {
    if (root == null) {
      return TreeNode(value);
    }

    if (value < root.value) {
      root.left = _insertRecursive(root.left, value);
    } else if (value > root.value) {
      root.right = _insertRecursive(root.right, value);
    }

    return root;
  }

  // Function to perform inOrder traversal of the binary search tree
  void inOrderTraversal(TreeNode? root) {
    if (root != null) {
      inOrderTraversal(root.left);
      print(root.value);
      inOrderTraversal(root.right);
    }
  }

  // Function to search for a value in the binary search tree
  bool search(int value) {
    return _searchRecursive(root, value);
  }

  bool _searchRecursive(TreeNode? root, int value) {
    if (root == null) {
      return false;
    }

    if (root.value == value) {
      return true;
    } else if (value < root.value) {
      return _searchRecursive(root.left, value);
    } else {
      return _searchRecursive(root.right, value);
    }
  }
}
