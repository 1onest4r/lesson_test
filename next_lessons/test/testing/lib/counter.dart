class Counter {
  int value = 0;

  int increment() {
    return value++;
  }

  int? decrement() {
    if (value == 0) return null;
    return value--;
  }

  int reset() {
    return 0;
  }
}
