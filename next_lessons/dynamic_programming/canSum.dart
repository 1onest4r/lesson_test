void main() {
  final myList = [3, 17];
  final targetNum = 20;
  print(canSum(targetNum, myList));
}

bool canSum(int target, List<int> list) {
  //base case
  if (target == 0) return true;
  if (target < 0) return false;

  //recursive case
  for (int i = 0; i < list.length; i++) {
    final remainder = target - list[i];
    if (canSum(remainder, list) == true) {
      return true;
    }
  }

  return false;
}
