import 'dart:core';
void main() {
  var short = const Line(1);
  var long = const Line(100);
  print(short.compareTo(long) < 0);
}

 class Line implements Comparator<Line> {
   final int length;
   const Line(this.length);

   @override
   int compareTo(Line other) => length - other.length;
 }