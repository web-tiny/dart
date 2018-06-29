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
```

