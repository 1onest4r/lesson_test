class TrieNode {
  final Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();

  void insert(String word) {
    TrieNode currentNode = root;
    for (int i = 0; i < word.length; i++) {
      final char = word[i];

      if (!currentNode.children.containsKey(char)) {
        currentNode.children[char] = TrieNode();
      }
      currentNode = currentNode.children[char]!;
    }
    currentNode.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode currentNode = root;
    for (int i = 0; i < word.length; i++) {
      final char = word[i];
      if (!currentNode.children.containsKey(char)) {
        return false;
      }
      currentNode = currentNode.children[char]!;
    }
    return currentNode.isEndOfWord;
  }
}

void main() {
  final myTrie = Trie();
  myTrie.insert('cat');
  myTrie.insert('cab');
  myTrie.insert('car');
  myTrie.insert('cabs');
  myTrie.insert('cow');
  print(myTrie.search('cat'));
}
