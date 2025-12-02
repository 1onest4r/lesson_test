class Stack<T> {
  final List<T> _data = [];

  bool get isEmpty => _data.isEmpty;

  void push(T value) {
    _data.add(value);
  }

  T? pop() {
    if (isEmpty) return null;
    return _data.removeLast();
  }

  @override
  String toString() {
    return _data.toString();
  }
}

class Edge<T> {
  final T destination;
  final int weight;
  Edge(this.destination, this.weight);

  @override
  String toString() {
    return '($destination, W:$weight)';
  }
}

class Graph<T> {
  final Map<T, List<Edge<T>>> _adjacencyList = {};
  final bool directed;
  Graph({this.directed = false});

  void addVertex(T vertex) {
    if (_adjacencyList.containsKey(vertex)) return;
    _adjacencyList[vertex] = [];
  }

  void addEdge(T source, T destination, {int weight = 1}) {
    // Create source and destination if they don't exist yet
    addVertex(source);
    addVertex(destination);

    // add an edge between source and destination
    _adjacencyList[source]!.add(Edge(destination, weight));

    // if this is an undirected graph, add edge from destination to source
    if (!directed) {
      _adjacencyList[destination]!.add(Edge(source, weight));
    }
  }

  void breathFirstSearch(T startVertex) {
    // make the queue
    final queue = LinkedListQueue<T>();

    // keep track of all the visited vertices
    final visited = <T>{};

    // initialize queue
    queue.enqueue(startVertex);
    visited.add(startVertex);

    // keep going until the queue is empty
    while (!queue.isEmpty) {
      // dequeue the next item
      final current = queue.dequeue();
      if (current == null) break;

      _processVertex(current);

      // visit all the neighbors
      for (final neighbor in _adjacencyList[current]!) {
        if (!visited.contains(neighbor.destination)) {
          queue.enqueue(neighbor.destination);
          visited.add(neighbor.destination);
        }
      }
    }
  }

  void depthFirstSearch(T startVertex) {
    //make a stack
    final stack = Stack<T>();
    final visited = <T>{};

    stack.push(startVertex);

    //keep going as long as the stack is not empty
    while (!stack.isEmpty) {
      final current = stack.pop();
      if (current == null) {
        break;
      }

      //if current is visited
      if (visited.contains(current)) continue;

      //add current to visited
      visited.add(current);
      _processVertex(current);

      //add all of the neighbors to the stack
      final neighbors = _adjacencyList[current] ?? [];
      for (final edge in neighbors) {
        final neighbor = edge.destination;
        if (!visited.contains(neighbor)) {
          stack.push(neighbor);
        }
      }
    }
  }

  void _processVertex(T vertex) {
    print(vertex);
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    _adjacencyList.forEach((vertex, edges) {
      String connections = edges
          .map((e) => '${e.destination}(${e.weight})')
          .join(', ');
      buffer.writeln('$vertex: $connections');
    });
    return buffer.toString();
  }
}

class Node<T> {
  Node(this.value, [this.next]);

  T value;
  Node<T>? next;

  @override
  String toString() {
    final result = StringBuffer();
    result.write(value);
    var nextNode = next;
    while (nextNode != null) {
      result.write(' -> ');
      result.write(nextNode.value);
      nextNode = nextNode.next;
    }
    return result.toString();
  }
}

class LinkedList<T> {
  Node<T>? head;
  Node<T>? tail;

  void addLast(T value) {
    final newNode = Node(value);
    if (isEmpty) {
      head = newNode;
      tail = newNode;
    } else {
      tail?.next = newNode;
      tail = newNode;
    }
  }

  void addFirst(T value) {
    final newNode = Node(value);
    if (isEmpty) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  T? removeFirst() {
    if (isEmpty) {
      throw Exception('The list is empty.');
    }

    final returnValue = head;
    head = head?.next;
    return returnValue?.value;
  }

  void removeLast() {
    if (isEmpty) {
      throw Exception('The list is empty.');
    }

    if (head == tail) {
      // one item in the list
      head = null;
      tail = null;
    } else {
      // many items in the list
      var current = head;
      while (current?.next != tail) {
        current = current?.next;
      }
      current?.next = null;
      tail = current;
    }
  }

  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) {
      return 'Empty';
    }
    return head.toString();
  }
}

class LinkedListQueue<T> {
  LinkedList<T> _data = LinkedList<T>();

  bool get isEmpty => _data.isEmpty;

  void enqueue(T value) {
    _data.addLast(value);
  }

  T? dequeue() {
    return _data.removeFirst();
  }

  @override
  String toString() {
    return _data.toString();
  }
}

void main() {
  final myGraph = Graph();
  myGraph.addEdge("A", "B");
  myGraph.addEdge("A", "E");
  myGraph.addEdge("A", "C");
  myGraph.addEdge("B", "C");
  myGraph.addEdge("B", "E");
  myGraph.addEdge("B", "D");
  myGraph.addEdge("C", "E");
  myGraph.addEdge("C", "F");
  myGraph.addEdge("C", "G");
  myGraph.addEdge("D", "G");
  myGraph.addEdge("E", "F");
  myGraph.addEdge("F", "H");
  myGraph.addEdge("G", "H");

  // myGraph.breathFirstSearch("A");
  myGraph.depthFirstSearch("A");

  print(myGraph);
}
