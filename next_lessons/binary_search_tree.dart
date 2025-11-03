void main() {
  final bst = BinarySearchTree();
  bst.insert(3);
  bst.insert(4);
  bst.insert(1);
  bst.insert(0);
  print(bst);
}

class BinarySearchTree {
  BinaryNode? root;

  void insert(int value) {
    root = _insert(root, value);
  }

  BinaryNode _insert(BinaryNode? node, int value) {
    if (node == null) {
      return BinaryNode(value);
    }
    if (value >= node.value) {
      node.rightChild = _insert(node.rightChild, value);
    } else {
      node.leftChild = _insert(node.leftChild, value);
    }

    return node;
  }

  bool? contains(int value) {
    if (root?.value == value) {
      return true;
    }
    while (root != null) {
      if (root?.value == value) {
        return null;
      }
    }
  }

  @override
  String toString() {
    final result = StringBuffer();
    result.write(root);
    return result.toString();
  }
}

void action(int value) {
  print(value);
}

class BinaryNode {
  final int value;
  BinaryNode? leftChild;
  BinaryNode? rightChild;

  BinaryNode(this.value, {this.leftChild, this.rightChild});

  bool get isLeftEmpty => leftChild == null;
  bool get isRightEmpty => rightChild == null;

  void travelPreOrder(void Function(int) action) {
    action(value);
    leftChild?.travelPreOrder(action);
    rightChild?.travelPreOrder(action);
  }

  void travelInOrder(void Function(int) action) {
    leftChild?.travelPreOrder(action);
    action(value);
    rightChild?.travelPreOrder(action);
  }

  void travelPostOrder(void Function(int) action) {
    leftChild?.travelPreOrder(action);
    rightChild?.travelPreOrder(action);
    action(value);
  }

  @override
  String toString() => _treeString(this);

  // Helper recursive method to format tree structure
  String _treeString(
    BinaryNode? node, [
    String prefix = '',
    bool isLeft = true,
  ]) {
    if (node == null) return '';

    final result = StringBuffer();

    // Right child first (so it appears above in the output)
    if (node.rightChild != null) {
      result.write(
        _treeString(
          node.rightChild,
          '$prefix${isLeft ? "│   " : "    "}',
          false,
        ),
      );
    }

    // Current node
    result.write('$prefix${isLeft ? "└── " : "┌── "}${node.value}\n');

    // Left child
    if (node.leftChild != null) {
      result.write(
        _treeString(node.leftChild, '$prefix${isLeft ? "    " : "│   "}', true),
      );
    }

    return result.toString();
  }
}
