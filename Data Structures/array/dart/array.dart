class CustomArray<T> {
  int length = 0;
  Map<int, T> _data = {};

  CustomArray();

  T? get(int index) {
    return _data[index];
  }

  int push(T item) {
    _data[length] = item;
    length++;
    return length;
  }

  T? pop() {
    if (length == 0) {
      return null;
    }
    T? lastItem = _data[length - 1];
    _data.remove(length - 1);
    length--;
    return lastItem;
  }

  T? deleteAt(int index) {
    T? item = _data[index];
    _shiftItems(index);
    return item;
  }

  int insertAt(int index, T item) {
    _shiftItemsForInsert(index);
    _data[index] = item;
    length++;
    return length;
  }

  void _shiftItems(int index) {
    for (int i = index; i < length - 1; i++) {
      _data[i] = _data[i + 1] as T;
    }
    _data.remove(length - 1);
    length--;
  }

  void _shiftItemsForInsert(int index) {
    for (int i = length; i > index; i--) {
      _data[i] = _data[i - 1] as T;
    }
  }

  void printArray() {
    List<T> elements = [];
    for (int i = 0; i < length; i++) {
      if (_data[i] != null) elements.add(_data[i]!);
    }
    print(elements);
  }
}

void main() {
  CustomArray<String> myArray = CustomArray<String>();
  myArray.push('hi');
  myArray.push('you');
  myArray.push('!');
  myArray.pop();
  myArray.deleteAt(0);
  myArray.push('there');
  myArray.insertAt(1, 'nice');
  myArray.printArray(); // Expect: [you, nice, there]
}
