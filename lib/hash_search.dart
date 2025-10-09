String? studentSearch(List<Student?> list, int id) {
  return list[id]?.name;
}

class Student {
  final String name;
  final int id;
  Student(this.id, this.name);
}
