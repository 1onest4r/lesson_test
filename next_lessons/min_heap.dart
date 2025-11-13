void main() {
  final myList = [7, 2, 5, 1, 9, 4, 8, 3];
  print(myList);

  final sortedList = heapSort(myList);
  print(sortedList);
}

List<int> heapSort(List<int> list) {
  final List<int> result = [];

  // Make a heap
  final heap = MinHeap();
  for (int i = 0; i < list.length; i++) {
    final value = list[i];
    heap.insert(value);
  }

  while (heap.top != null) {
    result.add(heap.removeMin()!);
  }

  return result.reversed.toList();
}

class MinHeap {
  final List<int> _data = [];

  int? get top {
    if (_data.isEmpty) return null;
    return _data[0];
  }

  //[]
  //iteration 1 [8]
  void insert(int value) {
    _data.add(value);
    //checking last item added
    int childIndex = _data.length - 1;
    //[8, 10, 16, 20, 21] always works
    int parentIndex = (childIndex - 1) ~/ 2;
    while (childIndex > 0 && _data[childIndex] > _data[parentIndex]) {
      _swap(childIndex, parentIndex);
      childIndex = parentIndex;
      parentIndex = (childIndex - 1) ~/ 2;
    }
  }

  void _swap(int index1, index2) {
    final temp = _data[index1];
    _data[index1] = _data[index2];
    _data[index2] = temp;
  }

  int? removeMin() {
    if (_data.isEmpty) return null;
    if (_data.length == 1) return _data.removeLast();
    //input [16, 8, 10, 6]  (length 4)

    final top = _data[0];
    _data[0] = _data.removeLast();
    //[6, 8, 10]  (length 4)
    while (true) {
      final parentIndex = 0;
      //1
      final leftChildIndex = 2 * parentIndex + 1;
      //2
      final rightChildIndex = 2 * parentIndex + 2;
      // 0
      int largestIndex = parentIndex;

      // check left child
      if (leftChildIndex < _data.length &&
          //6 < 8
          _data[largestIndex] < _data[leftChildIndex]) {
        //just make the current index = leftchildIndex
        largestIndex = leftChildIndex;
      }

      // check right child
      if (rightChildIndex < _data.length &&
          _data[largestIndex] < _data[rightChildIndex]) {
        //just make the current index = rightchildIndex
        largestIndex = rightChildIndex;
      }

      if (largestIndex != parentIndex) {
        _swap(largestIndex, parentIndex);
      } else {
        break;
      }
    }
    //[10, 8, 6]
    return top;
    //10
  }

  @override
  String toString() => _data.toString();
}
//TODO: it doesnt work yet.