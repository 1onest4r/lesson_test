class Stack<T> {
  final List<T> _data = [];

  bool get isEmpty => _data.isEmpty;

  void push(T value) {
    _data.add(value);
  }

  T? pop() {
    if (_data.isEmpty) return null;
    return _data.removeLast();
  }

  T peek() {
    return _data[_data.length - 1];
  }
}
