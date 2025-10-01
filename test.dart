void main() {
  class Hello {
    late final greet; 
    Hello(this.greet);
    @override 
    String toString() {
      final result = "hi";
      return result.toString();
    }
  }
  final hi = Hello("hi");
  print(result);
}