// import 'dart:core';
void main() {
  // 官网也太特么坑了，new都不写，
  var now = new DateTime.now();
  print(now); // 2018-07-03 17:41:28.252426
  print(now.year);
  print(now.month);
  print(now.day);
  print(now.hour);
  print(now.minute);
  print(now.millisecond);
  print(now.weekday);
  var y2k = new DateTime(2018);
  print(y2k); // 2018-01-01 00:00:00.000

  y2k = new DateTime(2018, 7, 3);
  print(y2k); // 2018-07-03 00:00:00.000

  y2k = new DateTime.utc(2018);
  print(y2k); // 2018-01-01 00:00:00.000Z

  /// add one year
  y2k = y2k.add(const Duration(days: 365));
  print(y2k); // 2019-01-01 00:00:00.000Z

  // subtract 30 days
  y2k = y2k.subtract(const Duration(days: 30));
  print(y2k); // 2018-12-02 00:00:00.000Z
}
