void lol(n) {
  final range = n;
  for (int i = 1; i <= range; i++) {
    if ((i % 3 == 0) && (i % 5 == 0)) {
      print("FIZZBUZZ");
    } else if (i % 3 == 0) {
      print("BUZZ");
    } else if (i % 5 == 0) {
      print("FIZZ");
    } else {
      print(i);
    }
  }
}

int sum(int start, int end) {
  int sum = 0;
  int combo = start + end;
  sum = combo * ((end - start + 1) ~/ 2);
  return sum;
}

void main() {
  // lol(1000);
  print(sum(1, 100));
}
