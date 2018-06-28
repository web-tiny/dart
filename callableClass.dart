void main() {
  var wf = new WannabeFunction();
  var out = wf('Hi', 'here', 'gang');
  print('$out');
}

/**
 * dart语言中为了能让类像函数一样被调用，可以实现call()方法
 */
class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c';
}