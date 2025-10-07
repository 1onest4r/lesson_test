import 'package:hashtables/binary_search.dart';
import 'package:hashtables/linear_search.dart';
import 'package:test/test.dart';

void main() {
  final myList = [42, 3, 10, 7, 28, 149, 0, 3, 25, 7, 1];
  test('linear search', () {
    expect(linearSearch(myList, 3), 2);
  });

  myList.sort();

  test('binary search', () {
    expect(binarySearch(myList, 0), 0);
  });
}
