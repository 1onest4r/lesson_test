List<int> mergeSort(List<int> list) {
  //base case
  if (list.length <= 1) {
    return list;
  }

  // divide
  final middle = list.length ~/ 2;
  final leftList = list.sublist(0, middle);
  final rightList = list.sublist(middle);

  // conquer
  final sortedLeft = mergeSort(leftList);
  final sortedRight = mergeSort(rightList);

  return eval(sortedRight, sortedLeft);
}

List<int> eval(List<int> right, List<int> left) {
  final List<int> myL = [];
  int leftIndex = 0;
  int rightIndex = 0;
  while (leftIndex < left.length && rightIndex < right.length) {
    final leftValue = left[leftIndex];
    final rightValue = right[rightIndex];

    if (leftValue < rightValue) {
      myL.add(leftValue);
      leftIndex++;
    } else {
      myL.add(rightValue);
      rightIndex++;
    }
  }

  if (leftIndex < left.length) {
    myL.addAll(left.sublist(leftIndex));
  }

  if (rightIndex < right.length) {
    myL.addAll(right.sublist(rightIndex));
  }

  return myL;
}
