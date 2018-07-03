## effective_dart_usage

##### 一:	在part of指令中使用字符串

```dart
library my_library;

part "some/other/file.dart";

part of "../../my_library.dart"	// good

part of my_library	// bad
```

#####  二：在编写字符串相关的code时记住以下规则

#####  1: Strings:

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

```dart
/**
*	1： Don't wrap a field in a getter and setter unnecessarily
*/
// bood
class Box {
  var contents;
}
// bad
class Box {
  var _contents;
  get contents => _contents;
  set contents(value) {
    _contents = value;
  }
}

/**
* 2: prefer  using a final field to make a read-only property
*/
// good
class Box {
  final contents = [];
}
// bad
class Box {
  var _contents;
  get contents => _contents;
}

/**
*	3: consider using => for simple members
*
*/
// good
double get area => (right - left) * (bottom - top);
bool isReady(num time) => minTime == null || minTime <= time;
String capitalize (String name) => '${name[0].toUpperCase()}${name.substring(1)}';
// good
Treasure openChest(Chest chest, Point where){
  if(_opened.containsKey(chest)) return null;
  var treasure = Treasure(where);
  treasure.addAll(chest.contents);
  _opened[chest] = treasure;
  return treasure;
}
//bad
Treasure openChest(Chest chest, Point where) =>
  _opened.containsKey(chest) ? null: _opened[chest] = treasure
  	..addAll(chest.contents);
// good
num get x => center.x;
set x(num value) => center = Point(value,center.y);

/**
*	4: Don't use this.when not needed to avoid shadowing.
*	The only time you need to use this. is when a local variable with the same name shadows the member you want to access.
*/
// bad
class Box {
  var  value;
  void clear () {
    this.update(null);
  }
  void update (value) {
    this.value = value;
  }
}
// good
class Box {
  var  value;
  void clear () {
    update(null);
  }
  void update (value) {
    this.value = value;
  }
}
// good (Note that constructor parameters never shadow fields in constructor initialization lists:)
class Bax extends BaseBox {
  var value;
  Box(value)
    ：value = value,
  	super(value);
}


/**
*	5: Do initialize fields at their declaration when possible
*	
*/
// bad
class Folder {
  final String name;
  final List<Documents> contents;
  Folder(this.name) : contents = [];
  Folder.temp() : name = 'temporary';
}
// good
class Folder {
  final String name;
  final List<Documents> contens = [];
  Folder(this.name);
  Folder.temp() : name = 'temporary';
}
```

##### 7: Constructors

```dart
/**
*	1：Do use initializing formals when possible
*	Many fields are initialized directly from a constructor parameter,like:
*/
// bad
class Point {
  num x, y;
  Point(num x, num y) {
    this.x = y;
    this.y = y;
  }
}
// good
class Point {
  num x, y;
  Point(this.x, this.y);
}

/**
* 2: Don't type annotate initializing formals
*/
// good
class Point {
  int x, y;
  Point(this.x, this.y);
}
// bad
class Point {
  int x, y;
  Point(int this.x, int this.y);
}

/**
*	3：Do use: instead of {} for empty constructor bodies
*/
// good
class Point {
  int x, y;
  Point(this.x, this.y);
}
// bad
class Point {
  int x, y;
  Point(this.x, this.y){}
}

/**
*	4：Don't use new
*	dart允许使用new，但是为了减少迁移痛苦，请考虑将其弃用并从代码中删除它
*/
// good
Widget build(BuilContent context) {
  return Row(
    children:[ 
      RaisedButton(child: Text('Increment'),
      ),
      Text('Click !'),
    ]
  )
}
// bad
Widget build(BuilContent context) {
  return new Row(
    children:[ 
      new RaisedButton(child: new Text('Increment'),
      ),
      new Text('Click !'),
    ]
  )
}

/**
* 5: Don't use const redundantly(冗余的)
*/
// good
const primaryColors = [
  Color('red', [255, 0, 0]),
  Color('green', [0, 255, 0]),
  Color('blue', [0, 0, 255]),
]; 
// bad
const primaryColors = const [
  const Color('red', const [255, 0, 0]),
  const Color('green', const [0, 255, 0]),
  const Color('blue', const [0, 0, 255]),
]; 

```

##### 8: Error handling

```dart
/** 
*	1：Avoid catches without on clauses.
*	2: Don't discard errors from catches without on clauses
*	3: Do throw objects that implement Error only for programmatic errors
*	4: Dont't explicitly catch Error or types that implements it
* 5: Do use rethrow to rethrow a caught exception
*/
// bad
try {
  somthingRisky();
} catch (e) {
  if (! canHandle(e)) throw e;
  handle(e);
}
// good
try {
  somthingRisky();
} catch (e) {
  if (! canHandle(e)) rethrow;
  handle(e);
}
```

##### 9: Asynchrony

```dart
/**
*	1： Prefer async/await over using raw futures
*/
// good
Future<int> countActivePlayer(String teamName) async {
  try {
    var team = await downloadTeam(teamName);
    if(team == null) return 0;
    var players = await team.roster;
    return players.where((player) => player.isActive).length;
  } cath (e) {
    log.error(e);
    return 0;
  }
}
// bad
Future<int> countActivePlayer(String teamName) {
  return downloadTeam(teamName).then((team) {
    if(team == null) return 0;
    return team.roster.then((players){
      return players.where((player) => player.isActive).length;
    });
  }).cathError((e){
    log.error(e);
    return 0;
  });
}

/**
*	2: DO test for Future<T> when disambiguating a FutureOr<T> whose type argument could be Object
*/
// good
Future<T> logValue<T>(Future<T> value) async {
  if (value is Future<T>) {
    var result = await value;
    print(result);
    return result;
  } else {
    print(value);
    return value as T;
  }
}
// bad
Future<T> logValue<T>(Future<T> value) async {
  if (value is T) {  
    print(value);
    return value;
  } else {
    var result = await value;
    print(result);
    return result;
  }
}

/**
*	3: Avoid using Completer directly
*/
// bad
Future<bool> fileContainsBear(String path) {
  var completer = Completer<bool>();
  File(path).readAsString().then((contens){
    completer.complete(contens.contains('bear'));
  });
  return completer.future;
}
// good
Future<bool> fileContainsBear(String path) {
  return File(path).readAsString().then((contens){
    contens.contains('bear');
  });
}
// good
Future<bool> fileContainsBear(String path) async {
  var contains = await File(path).readAsString();
  return contens.contains('bear');
}
/**
 * 4: Don't use async when it has no useful effect
 */
// good
Future afterTwoThing(Future first, Future second) {
  return Future.wait([first, second]);
}
// bad
Future afterTwoThing(Future first, Future second) async {
  return Future.wait([first, second]);
}
// good
Future usesAwait(Future later) async {
  print(await later);
}
Future asyncError() async {
  throw 'Error!';
}
Future asyncValue() async => 'value';
```

