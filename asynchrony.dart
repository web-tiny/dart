import 'dart:async';

/**
 * dart是单线程编程语言，如果进行I/O操作的时候可能会出现阻塞，用Future来实现异步操作
 */
Future main() async {
  checkVersion();
  print('In main():Version is ${await lookUpVersion()}');

  /**
   * 流处理
   */
  // 异步循环的结构如下：
  // await for (var request in requestServer) {

  // }
}

/**
 * async ... await必须成对出现
 */
Future checkVersion() async {
  var version = await lookUpVersion();
  try {
    version = await lookUpVersion();
  } catch (e) {
    print('${e.runtimeType}');
  }
}

/**
 * Declaring async functions:
 * 异步函数是一个函数，其正文用async修饰符标记。虽然异步函数可能会执行耗时的操作，但它会在其任何主体执行之前立即返回
 */
// String lookUpVersion() => '1.0.0';
Future <String> lookUpVersion() async => '1.0.0';
