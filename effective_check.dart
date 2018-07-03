import 'dart:math';
import 'dart:async';
import 'dart:io';


void main(){
  var objects = [1, 'a', 2, 'b', 3];
  var ints = objects.where((e) => e is int);
  print(ints);

  var ints2 = objects.where((e) => e is int).cast<int>();
  print(ints2);

  // var ints3 = objects.whereType<int>();
  // print(ints3);

  var stuff = <dynamic>[1, 2];
  // have a error
  // var ints4 = List<int>.from(stuff);
  // print(ints4);
  var radius = new Circle(5);
  print(radius.area);
  print(radius.area.toStringAsFixed(3));
  print(radius.cirecumference);
  print(radius.cirecumference.toStringAsFixed(3));

  // var voyage =Spacecraft('voyageer I', DateTime(2018, 9, 5));
  // voyage.describe();
}

List<int> singletonList(int value) {
  var list = <int>[];
  list.add(value);
  return list;
}

class Circle {
  num radius;
  Circle(this.radius);
  num get area => pi * radius * radius ;
  num get cirecumference => pi * 2.0 * radius;
}

/**
 * 这个异步函数怎么调用的？
 */
Future<T> logValue<T>(Future<T> value) async {
  if (value is Future<T>) {
    var result = await value;
    print(result);
    return result;
  } else {
    print(value);
    return value as T;
  }
}

/**
*	3: Avoid using Completer directly
*/
// bad
Future<bool> fileContainsBear(String path) {
  var completer = Completer<bool>();
  File(path).readAsString().then((contens){
    completer.complete(contens.contains('bear'));
  });
  return completer.future;
}

/**
 * Don't use async when it has no useful effect
 */
// good
Future afterTwoThing(Future first, Future second) {
  return Future.wait([first, second]);
}
