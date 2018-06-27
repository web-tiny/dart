import 'dart:math';

class Point {
  // Declare instance variable x ,initially null
  num x;
  num y;
  num z = 0;
  // defined constructor
  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }
  // defined named constructor
  Point.origin() {
    print(this.x);
  }
  /*初始化程序列表
  * 除了调用超类构造函数之外，还可以在构造函数体运行之前初始化实例变量。用逗号分隔初始值。
  */
  Point.fromJson(Map<String, num> json)
      :x = json['x'],
        y = json['y'] {
          print('In Point.fromJson(): ($x,$y)');
        }

  // 重定向构造函数
  // 代表主构造函数
  Point.alongXAxis(num x): this(x, 0);
}

void main() {
  var point = new Point.origin();
// use a dot(.) to refer to an instance variable or method:
  point.x = 4;
  print(point.x == 4);
  print(point.y);

  var pointFromJson = new Person.fromJson({'x':10, 'y':20});

  var emp = new Employee.fromJson({});
  if (emp is Person) {
    emp.firstName = 'Bob';
  }
  (emp as Person).firstName = 'Bob';
  print(emp.firstName);

  var pt = new PointTwo(10, 20);
  print(pt.distanceFromOring);

  var loggerConstructor = new Logger('tiny');
  print(loggerConstructor);
  // 官网的写法为啥报错
  // var logger = Logger('UI');
  // logger.log('button clicked');

  // 坑爹的官网居然不用new，直接搞，
  var rect =new Rectangle(3, 4, 20, 15);
  print(rect.left);
  rect.right = 12;
  print(rect.left);
}

// defined class Person
class Person {
  String firstName;
  Person.fromJson ( Map data ) {
    print('in Person');
  }
}

// class Employee extends Person
class Employee extends Person {
  Employee.fromJson( Map data): super.fromJson(data) {
    print('in Employee');
  }
}

// 初始化器列表在设置最终字段时非常方便
class PointTwo {
  final num x;
  final num y;
  final distanceFromOring;

  PointTwo(x, y)
    : x = x,
      y = y,
      distanceFromOring = sqrt( x * x + y * y);
}

/*  Constant constructors
*   确定类不会再变化时，可以将构造函数定义为常量构造函数，定义常量构造函数时，确保定义的变量都为final类型
*/
class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
  final num x, y;
  const ImmutablePoint(this.x, this.y);
}

/*  Factory constructors
*/
class Logger {
  final String name;
  bool mute = false;
  static final Map< String, Logger > _cache = < String, Logger >{};
  /**
   * Factory constructors have no access to this
   */
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }
  // Logger._internal(this.name);
  void log(String msg) {
    if (!mute) print(msg);
  }
  static _internal(name){
    return name;
  }
}

/**
 * Methods:
 * Methods are functions that provide behavior for an object.
 */
// instance methods on objects can access instance variables and this.
class PointThree {
  num x, y;
  PointThree(this.x, this.y);
  num distanceTo(Point other) {
    var dx = x - other.x ;
    var dy = y - other.y ;
    return sqrt(dx * dx + dy * dy);
  }
}

/**
 * Getters and setters
 * Getters and setters are special methods that provide read and write access to an object’s properties
 */
class Rectangle {
  num left, top, width, height;
  Rectangle (this.left, this.top, this.width, this.height);
  num get right => left + width;
  set right(num value) => left = value -width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

/**
 * Abstract methods:
 * 实例，getter和setter方法可以是抽象的，定义一个接口，但将其实现留给其他类。抽象方法只能存在于抽象类中。
 */
// 要使方法抽象，请使用分号（;）而不是方法体
abstract class Doer{
  // Define instance variables and methods...
  void doSomething(); // // Define an abstract method.
}
class EffectiveDoer extends Doer {
  void doSomething() {
    // Provide an implementation, so the method is not abstract here
  }
}