void pascalTriangle(int n) {
  for (int i = 0; i <= n; i++) {
    String line = ' ' * (n - i);
    int val = 1;
    for (int j = 0; j <= i; j++) {
      line += '$val ';
      val = val * (i - j) ~/ (j + 1);
    }
    print(line);
  }
}

int pascalValue(int row, int col) {
  if (col < 0 || col > row) return 0;
  int val = 1;
  for (int i = 0; i < col; i++) {
    val = val * (row - i) ~/ (i + 1);
  }
  return val;
}

void main() {
  pascalTriangle(16);
  // print(pascalValue(6, 3));
}
