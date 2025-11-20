import 'dart:math';

void main() {
  // final myList = [7, 5, 3, 8, 9, 1, 2, 4];
  // print(myList);
  // final sorted = sort(myList);
  // print(sorted);

  final random = Random();
  final myList = List.generate(1000000, (a) => random.nextInt(1000000));
  print("Sorting list with size of ${myList.length}");

  final stopWatch = Stopwatch();
  stopWatch.start();
  sort(myList);
  stopWatch.stop();

  print("Execution time: ${stopWatch.elapsedMilliseconds} ms");
}

List<int> sort(List<int> list) {
  //base case
  if (list.length <= 1) {
    return list;
  }

  // divide
  final middle = list.length ~/ 2;
  final leftList = list.sublist(0, middle);
  final rightList = list.sublist(middle);

  // conquer
  final sortedLeft = sort(leftList);
  final sortedRight = sort(rightList);

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
