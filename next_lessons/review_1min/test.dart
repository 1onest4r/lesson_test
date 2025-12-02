void main() {
  Map<String, dynamic> student1 = {"id": 21, "name": "Alice"};
  Map<String, dynamic> student2 = {"id": 12, "name": "alice"};
  Map<String, dynamic> student3 = {"id": 22, "name": "AlicE"};

  List<Map<String, dynamic>> students = [student1, student2, student3];
  for (var s in students) {
    print("ID: ${s['id']}, NAME:${s['name']}");
  }

  Set<int> set1 = {3, 6, 2, 5, 8};
  Set<int> set2 = {1, 2, 5, 9, 4};

  Set<int> commonNum = set1.intersection(set2);
  print(commonNum);
}
