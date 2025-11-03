// void main() {
//   final myList = [3, 7, 2, 6, 5, 1, 4, 9];
//   final value = 10;
//   print(linearSearch(myList, value));
// }

// int? linearSearch(List<int> list, int num) {
//   for (int i = 0; i < list.length; i++) {
//     if (list[i] == num) {
//       return i;
//     }
//   }
//   return -1;
// }

void main() {
  final myList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final find = 3;
  print(binarySearch(myList, find));
}

int? binarySearch(List<int> list, int num) {
  int low = 0;
  int high = list.length - 1;
  bool isTrue = low <= high;
  while (isTrue) {
    int mid = (low + high) ~/ 2;
    int guess = list[mid];
    if (guess == num) {
      return mid;
    } else if (guess > num) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}
