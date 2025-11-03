void main() {
  final myNode = BinaryNode(
    42,
    leftChild: BinaryNode(
      3,
      leftChild: BinaryNode(13),
      rightChild: BinaryNode(4),
    ),
    rightChild: BinaryNode(
      10,
      leftChild: BinaryNode(7),
      rightChild: BinaryNode(8, leftChild: BinaryNode(1)),
    ),
  );

  // print(myNode);

  // myNode.travelPreOrder(action);
  // myNode.travelInOrder(action);
  myNode.travelPostOrder(action);
}

void action(int value) {
  print(value);
}

class BinaryNode {
  final int value;
  final BinaryNode? leftChild;
  final BinaryNode? rightChild;

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
