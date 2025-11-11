//-------------------------PROBLEM TEAM------------------------------
//3 friends decided to implement the solution if at least 2 of em agrees
//0 is no 1 is yes

//input:
//line 1 (x) count of problem
//line x (b, y, z) state of each persons yes and no

void team() {
  final myInput = [
    "0 1 1",
    "1 1 1",
    "1 1 0",
    "1 0 1",
    "1 0 0",
    "0 0 1",
    "0 1 0",
    "0 0 0",
  ];
  final int numberOfProblem = 8;
  print("------------------PROBLEM TEAM------------------");
  print(evaluate(myInput, numberOfProblem));
  print("------------------------------------------------");
}

int evaluate(List<String> list, int max) {
  if (list.length != max) {
    return -1;
  }
  int sum = 0;
  int count = 0;
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list[i].length; j++) {
      String char = list[i][j];
      if (char == " " && char == "0") {
        continue;
      } else if (char == "1") {
        sum += 1;
      }
    }
    if (sum % 2 == 0) {
      count += 1;
    }
  }
  return count;
}

//----------------------------BIT++----------------------------
void bit() {
  final myBit = ["++X", "++X", "X--"];
  print("----------------------------BIT++----------------------------");
  print(operationCount(myBit)); //expected value (1)
  print("-------------------------------------------------------------");
}

int operationCount(List<String> list) {
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i].contains("++")) {
      sum++;
    } else if (list[i].contains("--") && sum != 0) {
      sum--;
    }
  }
  return sum;
}

//----------------------------NEXT ROUND----------------------------
void main() {
  final myNum = ["8 5", "10 9 8 7 7 7 5 5"];
  print("----------------------------NEXT ROUND----------------------------");
  print(nextRound(myNum)); // Output: 6
  print("------------------------------------------------------------------");
}

int nextRound(List<String> list) {
  final firstLine = list[0].split(" ");
  int passIndex = int.parse(firstLine[1]);

  final scores = list[1].split(" ").map(int.parse).toList();

  int kthScore = scores[passIndex - 1];
  int passed = scores.where((s) => s >= kthScore && s > 0).length;

  return passed;
}
//------------------------------------------------------------------