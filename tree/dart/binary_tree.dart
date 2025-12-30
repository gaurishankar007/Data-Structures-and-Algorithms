import 'dart:math';

void main() {
  BinaryTree tree = BinaryTree();

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
  print("InOrder traversal of the binary tree:");
  tree.inOrderTraversal(tree.root);
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val);
}

class BinaryTree {
  TreeNode? root;

  BinaryTree();

  // Function to insert a value into the binary tree
  void insert(int value) {
    root = _insertRecursive(root, value);
  }

  TreeNode _insertRecursive(TreeNode? root, int value) {
    if (root == null) {
      return TreeNode(value);
    }

    if (root.left == null) {
      root.left = _insertRecursive(root.left, value);
    } else if (root.right == null) {
      root.right = _insertRecursive(root.right, value);
    } else {
      // Choose either left or right subtree randomly to insert the value
      if (Random().nextBool()) {
        root.left = _insertRecursive(root.left, value);
      } else {
        root.right = _insertRecursive(root.right, value);
      }
    }

    return root;
  }

  // Function to perform inOrder traversal of the binary tree
  void inOrderTraversal(TreeNode? root) {
    if (root != null) {
      inOrderTraversal(root.left);
      print(root.val);
      inOrderTraversal(root.right);
    }
  }
}
