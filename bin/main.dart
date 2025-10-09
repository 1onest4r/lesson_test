import 'package:hashtables/hash_table.dart';
import 'package:hashtables/linear_search.dart';
import 'package:hashtables/binary_search.dart';

void main() {
  final myList = [42, 3, 10, 7, 28, 149, 0, 3, 25, 7, 1];
  final foundIndex = linearSearch(myList, 28);
  print(foundIndex);

  myList.sort();
  final binaryIndex = binarySearch(myList, 0);
  print(binaryIndex);

  // final studentList = List<Student?>.filled(3000000, null);

  final students = Hashtable();
  students.insert(Student("AZ", 2024078));
  students.insert(Student("AL", 2024077));
  students.insert(Student("OL", 2021018));
  students.insert(Student("PL", 2023139));
  students.insert(Student("BL", 2025068));
  students.insert(Student("KL", 2024008));
  students.insert(Student("ES1", 2024095));
  students.insert(Student("ED", 2024012));
  students.insert(Student("EB", 2024054));
  students.insert(Student("ES2", 2024111));
  students.insert(Student("NI", 2024059));
  students.insert(Student("MD", 2024025));
  students.insert(Student("MC", 2024020));
  students.insert(Student("MN", 2023002));
  students.insert(Student("TG", 2022081));
  students.insert(Student("TK", 2024085));
  students.insert(Student("TA", 2023096));
  students.insert(Student("UM", 2022007));
  students.insert(Student("VG", 2024007));

  // studentList[2024078] = Student(2024078, 'AZ1');
  // studentList[2024077] = Student(2024077, 'AZ2');
  // studentList[2021018] = Student(2021018, 'AD');
  // studentList[2023139] = Student(2023139, 'BB');
  // studentList[2025068] = Student(2025068, 'BS');
  // studentList[2024008] = Student(2024008, 'DD');
  // studentList[2024095] = Student(2024095, 'ES1');
  // studentList[2024012] = Student(2024012, 'ED1');
  // studentList[2024054] = Student(2024054, 'EB');
  // studentList[2024081] = Student(2024081, 'ED2');
  // studentList[2024111] = Student(2024111, 'ES2');
  // studentList[2024059] = Student(2024059, 'MI');
  // studentList[2024025] = Student(2024025, 'MB');
  // studentList[2024020] = Student(2024020, 'MC');
  // studentList[2023002] = Student(2023002, 'NM');
  // studentList[2022081] = Student(2022081, 'TG');
  // studentList[2024085] = Student(2024085, 'TK');
  // studentList[2023096] = Student(2023096, 'TA');
  // studentList[2022007] = Student(2022007, 'UM');
  // studentList[2024007] = Student(2024007, 'VG');

  // var studentName = studentSearch(studentList, 2024008);

  final studentName = students.getStudent(2022007);
  print(studentName);
}
