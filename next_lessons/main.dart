import 'dart:io';

void main() {
  stdout.write("enter:");
  String? input = stdin.readLineSync();
  final txt = _shorten(input!);
  print(txt);
}

String _shorten(String input) {
  if (input.length > 10) {
    final firstLetter = input[0];
    final lastLetter = input[input.length - 1];
    final length = input.length - 2;
    final text = firstLetter + length.toString() + lastLetter;
    return text;
  }
  return input;
}
