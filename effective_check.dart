void main(){
  var objects = [1, 'a', 2, 'b', 3];
  var ints = objects.where((e) => e is int);
  print(ints);

  var ints2 = objects.where((e) => e is int).cast<int>();
  print(ints2);

  var ints3 = objects.whereType<int>();
  print(ints3);

  var stuff = <dynamic>[1, 2];
  // have a error
  var ints4 = List<int>.from(stuff);
  print(ints4);
}

List<int> singletonList(int value) {
  var list = <int>[];
  list.add(value);
  return list;
}