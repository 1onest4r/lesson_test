import 'package:hashtables/hashtables.dart';
import 'package:hashtables/linear_search.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('linear search', () {
    expect(linearSearch([1, 2, 3, 4, 5, 6, 7], 3), 2);
  });
}
