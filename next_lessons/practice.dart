void mainBinary() {
  final bst = BinaryNode(
    10,
    leftChild: BinaryNode(
      9,
      leftChild: BinaryNode(0, leftChild: BinaryNode(-1)),
      rightChild: BinaryNode(12),
    ),
    rightChild: BinaryNode(
      11,
      leftChild: BinaryNode(9),
      rightChild: BinaryNode(13, rightChild: BinaryNode(16)),
    ),
  );

  print(bst);
  // bst.travelPreOrder(action);
  bst.travelInOrder(action);
  // bst.travelPostOrder(action);
}

void action(int value) {
  print(value);
}

class BinaryNode {
  int value;
  BinaryNode? leftChild;
  BinaryNode? rightChild;

  BinaryNode(this.value, {this.leftChild, this.rightChild});

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

void main() {
  // final bst = BinarySearchTree();
  // bst.insert(43);
  // bst.insert(42);
  // bst.insert(41);
  // bst.insert(44);
  // bst.insert(42);
  // bst.insert(41);
  // bst.insert(40);
  // print(bst);
  // // print(bst.contains(40));
  // print(bst.remove(41));

  mainBinary();
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

  bool contains(int value) {
    return _contains(root, value);
  }

  bool _contains(BinaryNode? node, int value) {
    if (node == null) return false;
    if (node.value == value) return true;

    if (value < node.value) {
      return _contains(node.leftChild, value);
    } else {
      return _contains(node.rightChild, value);
    }
  }

  void remove(int value) {
    root = _remove(root, value);
  }

  BinaryNode? _remove(BinaryNode? node, int target) {
    if (node == null) return null;

    if (target < node.value) {
      node.leftChild = _remove(node.leftChild, target);
    } else if (target > node.value) {
      node.rightChild = _remove(node.rightChild, target);
    } else {
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }

      if (node.leftChild == null) {
        return node.rightChild;
      }
      if (node.rightChild == null) {
        return node.leftChild;
      }

      int successor = _findMin(node.rightChild)!;
      node.value = successor;
      node.rightChild = _remove(node.rightChild, successor);
    }

    return node;
  }

  int? _findMin(BinaryNode? node) {
    while (node?.leftChild != null) {
      node = node!.leftChild;
    }
    return node?.value;
  }

  @override
  String toString() {
    final result = StringBuffer();
    result.write(root);
    return result.toString();
  }
}
