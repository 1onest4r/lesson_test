// String? studentSearch(List<Student?> list, int id) {
//   return list[id]?.name;
// }

class Student {
  final String name;
  final int id;
  Student(this.name, this.id);

  @override
  String toString() => "[$id] $name";
}

class Hashtable {
  // final _bucket = List<Student?>.filled(100, null);
  final _bucket = List<List<Student>>.generate(100, (_) => []);

  void insert(Student student) {
    final index = _hash(student.id);
    // _bucket[index] = student;

    _bucket[index].add(student);
  }

  int _hash(int studentId) {
    return studentId % 100;
  }

  Student? getStudent(int studentId) {
    // return _bucket[_hash(studentId)];
    final index = _hash(studentId);
    final studentsAtIndex = _bucket[index];
    for (final student in studentsAtIndex) {
      if (student.id == studentId) {
        return student;
      }
    }
    return null;
  }
}
