import 'dart:math';
import '../mergeSort2.dart';
import '../heapSort.dart';
import '../radixSort.dart';
import '../quickSort.dart';

void main() {
  const count = 1000000;
  final random = Random();

  print("Generaring $count random integers");
  final myList = List.generate(count, (_) => random.nextInt(count));

  print("Starting benchmark with $count elements");
  print("=" * 80);

  benchmarkSort("Merge Sort", (list) => mergeSort(list), myList); 

  benchmarkSort("Radix Sort", (list) => radixSort(List.from(list)), myList); 

  benchmarkSort("Heap Sort", (list) => heapSort(list), myList); 

  benchmarkSort("Quick Sort", (list) {
    final List<int> copy = List.from(list);
    quickSort(copy);
    return copy;
  }, myList); 

  print("=" * 80);
  print("Benchmark is complete");

}

void benchmarkSort(String name, List<int> Function(List<int>) sortFunc, List<int> list) {
  final testList = List<int>.from(list);

  final watch = Stopwatch();
  watch.start();

  final sorted = sortFunc(testList);

  watch.stop();

  bool isSorted = true;
  for (int i = 1; i < min(100, sorted.length); i++) {
    if (sorted[i] < sorted[i - 1]) {
      isSorted = false;
      break;
    }
  }

  print("$name: ${watch.elapsedMilliseconds} ms ${isSorted ? "sorted" : "failed to sort"}");
}