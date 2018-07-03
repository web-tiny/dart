import 'dart:core';

void main() {
  var short = const Line(1);
  print(short); // Instance of 'Line'
  var long = const Line(100);
  print(short.compareTo(long) < 0); // true

  /**
   * 官网又不用new，真是醉了
   */
  var p1 = new Person('Bob', 'Smith');
  var p2 = new Person('Bob', 'Smith');
  var p3 = 'Not a person';
  print(p1.hashCode == p2.hashCode);
  print(p1 == p2);
  print(p1 != p3);

  // Iterable objects can be used with for-in
  for(var process in Processes()){
    // Do something with the process
  }
}

/**
 * Comparing objects
 */
class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

/**
 * Implementing map keys
 */
class Person {
  final String firstName, lastName;
  Person(this.firstName, this.lastName);

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + firstName.hashCode;
    result = 37 * result + lastName.hashCode;
    return result;
  }

  @override
  bool operator == (dynamic other) {
    if(other is! Person) return false;
    Person person = other;
    return (person.firstName == firstName && person.lastName == lastName);
  }
}

/**
 * Iteration(迭代)
 * The Iterable and Iterator classes support for-in loops.Extend (if possible) or implement Iterable
 * whenever you create a class that can provide Iterator for use in for-in loops.Implement Iterator
 * to define the actual ability
 */
class Process { }
class IterableBase { }
class ProcessIterator implements Iterator<Process> {
  @override
  Process get current => current;
  @override
  bool moveNext() => true;
}
class Processes extends IterableBase<Process> {
  @override
  final Iterator<Process> iterator = ProcessIterator();
}

/**
 * Exceptions
 */