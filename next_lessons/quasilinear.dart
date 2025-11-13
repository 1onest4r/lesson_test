void main() {
  final myList = [7, 2, 5, 1, 9, 4, 8, 3];
  print(myList);
  final sortedList = mergeSort(myList);
  print(sortedList);
}

List<int> mergeSort(List<int> list) {
  // base case (when are we finished)
  if (list.length <= 1) {
    return list;
  }

  // divide
  final middle = list.length ~/ 2;
  final leftList = list.sublist(0, middle);
  final rightList = list.sublist(middle);

  // conquer (merge)
  final sortedLeft = mergeSort(leftList);
  final sortedRight = mergeSort(rightList);

  return merge(sortedRight, sortedLeft);
}

List<int> merge(List<int> right, List<int> left) {
  final List<int> result = [];
  int leftIndex = 0;
  int rightIndex = 0;
  while (leftIndex < left.length && rightIndex < right.length) {
    final leftValue = left[leftIndex];
    final rightValue = right[rightIndex];
    if (leftValue < rightValue) {
      result.add(leftValue);
      leftIndex++;
    } else {
      result.add(rightValue);
      rightIndex++;
    }
  }

  if (leftIndex < left.length) {
    result.addAll(left.sublist(leftIndex));
  }

  if (rightIndex < right.length) {
    result.addAll(right.sublist(rightIndex));
  }
  return result;
}
