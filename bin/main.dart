import 'package:hashtables/hash_search.dart';
import 'package:hashtables/linear_search.dart';
import 'package:hashtables/binary_search.dart';

void main() {
  final myList = [42, 3, 10, 7, 28, 149, 0, 3, 25, 7, 1];
  final foundIndex = linearSearch(myList, 28);
  print(foundIndex);

  myList.sort();
  final binaryIndex = binarySearch(myList, 0);
  print(binaryIndex);

  final studentList = [
    Student("AZ", 2024078),
    Student("AL", 2024077),
    Student("OL", 2021018),
    Student("PL", 2023139),
    Student("BL", 2025068),
    Student("KL", 2024008),
    Student("ES1", 2024095),
    Student("ED", 2024012),
    Student("EB", 2024054),
    Student("ES2", 2024111),
    Student("NI", 2024059),
    Student("MD", 2024025),
    Student("MC", 2024020),
    Student("MN", 2023002),
    Student("TG", 2022081),
    Student("TK", 2024085),
    Student("TA", 2023096),
    Student("UM", 2022007),
    Student("vG", 2024007),
  ];
}
