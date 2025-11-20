import 'dart:math';

void main() {
  //general init
  DateTime timeStamp = DateTime.now();
  final sizeOfList = 1000000;
  final generatedList = List.generate(
    sizeOfList,
    (a) => Random().nextInt(sizeOfList),
  );
  final radixStopWatch = Stopwatch();
  final mergeStopWatch = Stopwatch();

  //timing radix sort
  radixStopWatch.start();
  radixSort(generatedList, "LSD");
  radixStopWatch.stop();

  //timing merge sort
  mergeStopWatch.start();
  mergeSort(generatedList);
  mergeStopWatch.stop();

  final DateTime test = DateTime.now();
  print("=" * 70);
  print(
    "Size of the input: ${sizeOfList}\nElapsed time in milliseconds (Radix sort 'LSD'): ${radixStopWatch.elapsedMilliseconds}\nElapsed time in milliseconds (Merge sort): ${mergeStopWatch.elapsedMilliseconds}\nTime stamp before sorting: $timeStamp\nTime stamp after sorting: $test",
  );
  print("=" * 70);
}

List<int> radixSort(List<int> list, String BSD) {
  if (list.length <= 1) {
    return list;
  }
  int placeHolder = 1;

  int biggest = list[0];
  for (int i = 0; i < list.length; i++) {
    if (list[i] > biggest) {
      biggest = list[i];
    }
  }

  final numberOfDigits = biggest.toString().length;

  for (int num = 0; num < numberOfDigits; num++) {
    final buckets = List<List<int>>.generate(10, (_) => []);
    for (int value in list) {
      final digit = (value ~/ placeHolder) % 10;
      buckets[digit].add(value);
    }

    list.clear();
    for (final bucket in buckets) {
      list.addAll(bucket);
    }
    placeHolder *= 10;
  }

  return list;
}

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
