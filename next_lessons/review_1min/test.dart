import 'dart:convert';

void main()  {
    Map<String, int> myMap = {
        "id": 20245,
        "name": 0010,
      };

    String jsonString = jsonEncode(myMap);
    print(jsonString);

    Map<String, dynamic> newMap = jsonDecode(jsonString);
    print(newMap);
  }
