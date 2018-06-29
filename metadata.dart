void main () {

}
/**
 * metadata（元数据）: 
 *  使用元数据给代码添加更多的信息，
 *  元数据由一系列注释组成，每个注释都以字符@开头，后跟一个以标识符开头的常量表达式
 * 
 * 目前Dart语言提供的三个可用的@修饰符
 *  @deprecated
 *  @override
 *  @proxy
 */

class Television {
  @deprecated
  void activate () {
    turnOn();
  }

  void turnOn () {}
}

// you can define your own metadata annotations.
// library todo;
class Todo {
  final String who;
  final String what;
  const Todo(this.who, this.what);
}
@Todo('seth', 'make this do something')
void doSomething () {
  print('do something');
}