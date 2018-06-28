import 'dart:async';

void main() {
  var it = naturalsTo(5).iterator;
  print(naturalsTo(5).iterator); // Instance of '_SyncIterator'
  while (it.moveNext()) {
    print(it.current);
  }

  asynchronousNaturalsTo(4).listen((v){
    print(v);
  });
}

/**当你需要懒惰的生成一系列值时，可以考虑使用生成器函数
 * 生成器有两种类型：
 *  同步生成器
 *  异步生成器
 * 
 */

// 通过在函数主体前添加sync*可以快速标记该函数为同步生成器
Iterable<int> naturalsTo(int n) sync* {
  print('begin');
  int k = 0;
  while (k < n) {
    yield k++ ;
  }
  print('over');
}

// 异步生成器：async*
Stream asynchronousNaturalsTo(n) async* {
  print('begin');
  int k = 0;
  while (k < n) {
    yield k ++ ;
  }
  print('end');
}
