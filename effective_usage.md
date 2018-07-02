## effective_dart_usage

##### 一:	在part of指令中使用字符串

```dart
library my_library;

part "some/other/file.dart";

part of "../../my_library.dart"	// good

part of my_library	// bad
```

#####  二：在编写字符串相关的code时记住以下规则

#####  1:Strings:

```dart
/// 1：使用相邻的字符串连接字符串文字
// good
raiseAlarm(	
  'ERROR:Parts of the spaceship are on fire.'
  'parts are overrun by martians.'
);

// bad
raiseAlarm(
  'ERROR:Parts of the spaceship are on fire.' +
  'parts are overrun by martians.'
);

/// 2：使用插值来组合字符串和值
// good
'Hello, $name! You are ${year - birth} years old.'; 

 //bad
'Hello,' + name + '!You are' + (year - birth).toString() + 'years old';

/// 3: 花括号里都是表达式，单个字符的时候不要用花括号
// good
'Hi, $name !'  
'Wear your wildest ${year-birth}';

 // bad
'Hi, ${name} !';
```

##### 2: Collections:

```dart
/// 1: 尽可能使用集合文字
// good
var points = [];
var addresses = {};
//bad
var points = List();
var addresses = Map();

// good 
var points = <Point>[];
var addresses = <String, Address>{};
// bad
var points = List <Point> ();
var addresses = Map <String, Address>();

/// 2: 不要使用.length来查看一个集合是否为空。
// good
if(lunchBox.isEmpty) return 'so hungry...';
if(words.isNotEmpty) return words.join(' ');
// bad
if(lunchBox.length == 0) return 'so hungry...';
if (!words.isEmpty) return words.join(' ');

/**
*	3: 考虑使用更高阶的方法来转换序列,
*	如果你有一个集合，并且想从中产生一个新的已修改集合，那么使用.map（），.where（）和Iterable上的其他方便的方法通常会更短，更具说明性
*/
var aquaticNames = animals
  .where((animal) => animal.isAquatic)
  .map((animal) => animal.name)
  
/**
*	4: 在Dart中，如果你想迭代一个序列，那么使用循环的惯用方式就是这样
*	 但是，如果你想要做的就是调用一些已经存在的函数，每个元素作为参数。在这种情况下，forEach（）很方便
*/
// good
for (var person in people) {...}
// bad
people.forEach((person){...});
// good
people.forEach(print);

/**
*	5: 除非你打算改变结果的类型，否则不要使用List.from（）
*/
// 第一种方法不但简短，最重要的区别是它能保持原有的参数类型
var copy1 = iterable.toList();
var copy2 = List.from(iterable);

// Creates a List<int>:
var iterable = [1, 2, 3];
// Prints "List<int>":
print(iterable.toList().runtimeType);
// Prints "List<dynamic>":
print(List.from(iterable).runtimeType);

// 如果想改变数据的类型的话List.from()是不错的选择
var numbers = [1, 2.3, 4]; // List<num>.
numbers.removeAt(1); // Now it only contains integers.
var ints = List<int>.from(numbers);

/**
*	6：使用whereType()按类型过滤集合
*/
// bad
var objects = [1, 'a', 2, 'b', 3];
var ints = objects.where((e) => e is int);
// good
// 但是用vscode运行时提示暂时不支持此方法
var ints3 = objects.whereType<int>();

/**
* 7: 避免使用cast()来更改集的类型
*/
// good
List<int> singletonList(int value) {
  var list = <int>[];
  list.add(value);
  return list;
}
// bad
List<int> singletonList(int value) {
  var list = [];
  list.add(value);
  return list.cast<int>();
}

// good
void printEvents(List<Object> objects) {
  for(var n in objects){
    if((n as int).inEven) print(n);
  }
}
// bad
void printEvents(List<Object> objects) {
  for(var n in objects.cast<int>()){
    if(n.inEven) print(n);
  }
}

// good
int median(List<Object> objects){
  var ints = List<int>.from(objects);
  ints.sort();
  return ints[ints.length ~/ 2];
}
// bad
int median(List<Object> objects){
  var ints = objects.cast<int>();
  ints.sort();
  return ints[ints.length ~/ 2];
}
```

##### 3: Functions

```dart
/**
*	1: DO use a function declaration to bind a function to a name
*/
// good
void main(){
    localFunction(){...}
}
// bad
void main(){
    var localFunction = (){...}
}

/**
*	2: DON’T create a lambda when a tear-off will do
*/
// good
names.forEach(print);
// bad
names.forEach((name){
    print(name);
})
```

##### 4: Parameters:

```dart
/**
* 1: DO use = to separate a named parameter from its default value.
*/
// good
void insert(Object item, {int at = 0}){...}
// bad
void insert(Object item, {int at: 0}){...}

/**
* 2: DON'T use an explicit(显示的) value of null
*/
// good
void error([String message]){ stderr.write(message ?? '\n');}
// bad
void error([String message = null]){ stderr.write(message ?? '\n');}
```

##### 5: Variables:

```dart
/**
*	1: Don't explicitly initialize variables to null.
*/
// good
int _nextId;
class LazyId {
    int _id;
    int get id {
        if(_nextId == null) _nextId = 0;
        if(_id == null) _id = _nextId ++;
        return _id;
    }
}
// bad
int _nextId = null;
class LazyId {
    int _id = null;
    int get id {
        if(_nextId == null) _nextId = 0;
        if(_id == null) _id = _nextId ++;
        return _id;
    }
}

/**
* 	2: avoid storing what you can calculate
*/
// good
class Circle {
    num radius;
    Circle(this.radius);
    num get area => pi * radius * radius;
    num get circumference => pi * 2.0 * radius;
}
// bad
class Circle {
    num radius;
    num area;
    num circumference;
    Circle(this.radius)
    	:radius = radius,
    	area = pi * radius * radius,
    	circumference => pi * 2.0 * radius;
}
// bad (To correctly handle cache invalidation,we need to do this:)
class Circle {
    num _radius;
    num get radius => _radius;
    set radius(num value){
        _radius = value;
        _recalculate();
    }
    
    num _area;
    num get area => _area;
    
    num _circumference;
    num get circumference => _circumference;
    
    Circle(this._radius){
        _recalculate();
    }
    void _recalculate(){
        _area = pi * radius * radius;
        _circumference = pi * 2.0 * radius;
    }
}
```

##### 6: Members: