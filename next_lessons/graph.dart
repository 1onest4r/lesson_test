class Edge<T> {
  final T destination;
  final int weight;
  Edge(this.destination, this.weight);

  @override
  String toString() {
    return "$destination, W: $weight";
  }
}

void main() {
  final myGraph = Edge("A", 1);
  print(myGraph);
}