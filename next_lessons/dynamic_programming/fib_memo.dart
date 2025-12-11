int fib(int n, [Map<int, int>? memo]) {
  memo ??= {};

  if (memo[n] != null) return memo[n]!;

  if (n <= 2) return 1;
  memo[n] = fib(n - 1, memo) + fib(n - 2, memo);
  return memo[n]!;
}

void foo(int n) {
  if (n <= 1) return;
  foo(n - 1);
}

void bar(int n) {
  if (n <= 1) return;
  bar(n - 2);
}

//O(2^n)
void dib(int n) {
  if (n <= 1) return;
  dib(n - 1);
  dib(n - 1);
}

//O(2^(n/2)) => (O(2^n))
void lib(int n) {
  if (n <= 1) return;
  dib(n - 2);
  dib(n - 2);
}

void main() {
  print(fib(6));
  print(fib(7));
  print(fib(8));
  print(fib(50));
  final myMap = {'name': "Alvin", 'favColor': 'Gray'};
  print(myMap.containsKey('name'));
  print(myMap.containsKey('favColor'));
  print(myMap["name"] != null);
}
