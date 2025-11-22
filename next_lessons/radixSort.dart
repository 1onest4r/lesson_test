//it can get faster than the O(nlogn)
//we start sorting from the LSD(least significant digit), (also MSD works too)
List<int> radixSort(List<int> list) {
  // DONE: if the list is only two long just finish it
  if (list.length <= 1) {
    return list;
  }
  // DONE: make a variable to hold the place (1, 10, 100, 1000, etc.)
  int placeHolder = 1;

  // DONE: i need to know how many times i need to loop
  //      DONE: find the biggest value in the array

  // list.sort();
  // final biggest = list[list.length - 1];
  int biggest = list[0];
  for (int i = 0; i < list.length; i++) {
    if (list[i] > biggest) {
      biggest = list[i];
    }
  }

  //      DONE: count how many digits are in there
  final numberOfDigits = biggest.toString().length;

  for (int num = 0; num < numberOfDigits; num++) {
    // DONE: make 10 buckets
    final buckets = List<List<int>>.generate(10, (_) => []);
    // loop through every number in the list
    for (int value in list) {
      // DONE: find the digit
      final digit = (value ~/ placeHolder) % 10;
      // DONE: put the number in the bucket
      buckets[digit].add(value);
    }

    // DONE: clear the list
    list.clear();
    // DONE: add the all of the values back into the list
    for (final bucket in buckets) {
      list.addAll(bucket);
    }
    placeHolder *= 10;
  }

  return list;
}
