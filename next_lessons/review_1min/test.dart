void main() {
  final myList = [5, 9, 24, 0, -1, 10];
  final myMap = {
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
  };
  final tmp = [];
  int sum = 0;

  for (int i = 0; i < myList.length; i++) {
    sum += myList[i];
  }
  print(sum);

  print(myMap[6]);
  for (int i = 0; i < myMap.length; i++) {
    print("$i is spelled ${myMap[i]}");
  }
  print("+" * 100);
  for (final key in myMap.keys) {
    print("$key is spelled ${myMap[key]}");
  }

  void reverse(List<int> list) {
    //base case
    if (list.isNotEmpty) {
      tmp.add(list[list.length]);
    }
    //recursive
  }
}
