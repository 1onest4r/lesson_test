void quickSort(List<int> list) {
  _quickSort(list, 0, list.length - 1);
}

void _quickSort(List<int> list, int low, int high) {
  if (low >= high) return;
  final pivotIndex = _lomutoPartition(list, low, high);
  _quickSort(list, low, pivotIndex - 1);
  _quickSort(list, pivotIndex + 1, high);
}

int _lomutoPartition(List<int> list, int low, int high) {
  int pivot = list[high];
  int smaller = low - 1;

  for (int current = low; current < high; current++) {
    if (list[current] <= pivot) {
      smaller++;
      _swap(list, smaller, current); // FIXED
    }
  }

  smaller++;
  _swap(list, smaller, high); // FIXED
  return smaller;
}

void _swap(List<int> list, int indexA, int indexB) {
  if (indexA == indexB) return;
  final tempValue = list[indexA];
  list[indexA] = list[indexB];
  list[indexB] = tempValue;
}
