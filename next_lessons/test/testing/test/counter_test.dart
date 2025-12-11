import 'package:testing/counter.dart';
import 'package:test/test.dart';

void main() {
  test('Increment the value by 1', () {
    final counter = Counter();
    final result = counter.increment();
    expect(result, counter.value);
  });

  test("Decrement the counter by 1", () {
    final counter = Counter();
    final result = counter.decrement();
    // expect(result, (counter.value));
  });
}
