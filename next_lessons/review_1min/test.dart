class Edge<T> {
  final T destination;
  final int weight;
  Edge(this.destination, this.weight);

  @override
  String toString() {
    return "$destination, W: $weight";
  }
}

class Graph<T>{
  final Map<T, List<Edge<T>>> _adjacencyList = {};
  final bool directed;
  Graph({this.directed = false});

  void addVertex(T vertex) {
    if (_adjacencyList.containsKey(vertex)) return;
    _adjacencyList[vertex] = [];
  }

  void addEdge(T source, T destination, {int weight = 1}) {
    addVertex(source);
    addVertex(destination);

    //add an edge between the source and destination
    _adjacencyList[source]!.add(Edge(destination, weight));

    //if this is an undirected graph, add edge from destination to source 
    if (!directed) {
      _adjacencyList[destination]!.add(Edge(destination, weight));
    }
  }
  @override
  String toString() {
    final result = StringBuffer();
    _adjacencyList.forEach((vertex, edges) {
      String connections = edges.map((e) => "${e.destination} (${e.weight})").join(", ");
      result.write("$vertex: $connections");
    });
    return result.toString();
  }
}

void main() {
  final myGraph = Graph();
  myGraph.addEdge("Alice", "Bob");
  myGraph.addEdge("Alice", "Charlie");
  myGraph.addEdge("Bob", "Diana");
}