import 'package:test/test.dart';
import 'package:testing/stack.dart';

void main() {
  //write the test
  test('Stack has isEmpty method', () {
    final stack = Stack();
    final result = stack.isEmpty;
    expect(result, true);
  });

  //make it work
  test('If pushing to the stack, then it is not empty', () {
    final stack = Stack();
    stack.push(42);
    final result = stack.isEmpty;
    expect(result, false);
  });

  test("Pop returns the top value of the stack", () {
    final stack = Stack();
    stack.push(42);
    final result = stack.pop();
    expect(stack.isEmpty, true);
    expect(result, 42);
  });

  test("Peek return the last item of the list", () {
    final stack = Stack();
    stack.push(42);
    final result = stack.peek();
    expect(stack.isEmpty, false);
    expect(result, 42);
  });

  test("Pop an empty stack", () {
    final stack = Stack();
    final result = stack.pop();
    expect(result, null);
  });

  test("Stack can handle strings", () {
    final stack = Stack();
    stack.push("Hello");
    final result = stack.peek();
    expect(result, "Hello");
  });

  test("Stack is LIFO", () {
    final stack = Stack();
    stack.push(42);
    stack.push(3);
    stack.push(10);
    expect(stack.pop(), 10);
    expect(stack.pop(), 3);
    expect(stack.pop(), 42);
  });
  //refactor
}
