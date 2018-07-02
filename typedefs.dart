void main() {
  Logger l = new Logger();
  l.log('hello world');
  l.out = timestampLoggerOutputFunction;
  l.log('hello world');

  print(sort is Compare<int>); // true
}

/**
 * 目前，typedefs仅限于函数类型，
 * typedefs的一个典型引用是定义回调函数接口
 */
typedef void LoggerOutPutFunction(String msg);

class Logger {
  LoggerOutPutFunction out;
  Logger () {
    out = print;
  }
  void log (String msg) {
    out(msg);
  }
}

void timestampLoggerOutputFunction(String msg) {
  String timeStamp = 'Dart';
  print('$timeStamp:$msg');
}

/**
 * 因为typedefs只是别名，所以它们提供了一种方法来检查任何函数的类型
 */
typedef Compare<T> = int Function(T a, T b);
int sort(int a, int b) => a - b;
