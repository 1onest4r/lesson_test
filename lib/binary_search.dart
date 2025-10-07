int? binarySearch(List<int> list, int value) {
  for (int i = 0; i < list.length; i++) {
    int low = 0;
    int high = list.length - 1;
    int mid = (low + high) ~/ 2;
    int guess = list[i];
    if (guess == value) {
      return i;
    } else if (guess > value) {
      low = mid - 1;
    } else if (guess < value) {
      high = mid + 1;
    }
  }
  return null;
}
