// BRUTE FORCE:
//  O(2^(m+n))
//  space O(m+n)

// MEMO
//  O(m*n)
//  O(m+n)

void main() {
  print(gridTraveler(2, 3)); //expected output (3)
  print(gridTraveler(18, 18)); //expected output (2333606220)
}

int gridTraveler(int row, int col, [Map<String, int>? memo]) {
  memo ??= {};

  final key = '$row,$col';
  //  base case
  if (memo.containsKey(key)) return memo[key]!;
  if (row == 1 && col == 1) return 1;
  if (row == 0 || col == 0) return 0;

  // recursive case
  memo[key] =
      gridTraveler(row - 1, col, memo) + gridTraveler(row, col - 1, memo);
  return memo[key]!;
}
