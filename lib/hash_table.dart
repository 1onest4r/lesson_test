// String? studentSearch(List<Student?> list, int id) {
//   return list[id]?.name;
// }

import 'dart:io';

class Student {
  final String name;
  final int id;
  Student(this.name, this.id);

  @override
  String toString() => "[$id] $name";
}

class Hashtable {
  final _bucket = List<Student?>.filled(100, null);

  void insert(Student student) {
    final index = _hash(student.id);
    _bucket[index] = student;
  }

  int _hash(int studentId) {
    return studentId % 100;
  }

  Student? getStudent(int studentId) {
    return _bucket[_hash(studentId)];
  }
}
