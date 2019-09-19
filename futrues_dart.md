```dart
/*
 * @Author: tiny.jiao@aliyun.com 
 * @Date: 2019-09-18 21:30:19 
 * @Last Modified by: tiny.jiao@aliyun.com
 * @Last Modified time: 2019-09-18 23:33:54
 */
```
#dart语法特点总结
##1:定义变量的方式
>1: var/final/const/int/String/
##2:Numbers(int,double)
```dart
// Numbers分为两种类型：int/double

// String -> int
var n1 = int.parse('1'); // 1
// String -> double
var n2 = double.parse('1.1'); // 1.1
// int -> String
var str1 = 1.toString(); // '1'
// double -> String
var str2 = 3.1415.toStringAsFixed(2) // '3.14'
```
##3:Strings(''' ''', r'','$s')
```dart
// 1:UTF-16编码
// 2:字符串中使用表达式的方式($s/${s})：
var s = 'string interpolation';
var str = 'dart has $s';
// 3:使用三个单引号或者双引号也可以 创建多行字符串对象
var s1 = '''
you can create
multi-line strings like this one.
''';
var s2 = """this is alse a multi-line string.""";
// 4:通过提供一个 r 前缀可以创建一个 “原始 raw” 字符串
var s3 = r"in a raw string, even \n isn't special."
```
##4:Booleans
```dart
// 当dart需要一个布尔值的时候，只有true对象才被认为是true，所有其他的值都是false,其实这样设计也挺好，可以规避一些奇怪的行为
var name = 'Blob';
if(name){
  // prints in javascript,not in dart
  print('You have a name!');
}
```
##5:Lists
```dart
// dart list就是js中array
// 常量数组
var constList = const [1, 2, 3];
```
##6:Maps
```dart
// 跟ES6的Map一样的用法
```
##7:Function
```dart
// 所有函数都返回一个值，如果没有指定返回值，则会把return null;作为函数都最后一个语句执行
eg:
foo() {};
print(foo); // null
```
##8:类型判定操作(as, is, is!)
```dart
// 1:as:类型转换
(emp as Person).firstName = 'Bob';
// 2:is,如果对象是指定的类型返回 True
if (emp is Person) {
  emp.firstName = 'Jack';
}
// 如果对象是指定的类型返回 False
if (!(emp is! Person)) {
  emp.firstName = 'Jack';
}
```
##9:算术操作符(~/)
```dart
// ~/,除号，但是返回值为整数
assert(5 ~/ 2 == 2);
```
##10:赋值操作符(??=)
```dart
// 1:给a变量赋值
a = value;
// 2:??=,如果b是null，则赋值给b，如果不是null，则b的值保持不变；
b ??= value;
```
##11:条件表达式(expr1 ?? expr2)
```dart
// 1:三元运算符
// 2:expr1 ?? expr2:如果expr1是non-null,返回其值，否则执行expr2并返回其结果
String toString(msg) => msg ?? (msg = 'tiny');
print(toString('jrg')); // jrg
print(toString(null)); // tiny
```
##12:级联操作符(..)
```dart
// 级联操作符可以在同一个对象上连续调用多个函数以及访问成员变量，可以避免创建临时变量
querySeletor('.button')
..text = 'Confirm'
..classes.add('important')
..onClick.listen((e)=>window.alert('confirmed!'));
// 上面的代码等同于下面的代码
var button = querySeletor('.button');
button.text = 'Confirm';
button.classes.add('important');
button.onClick.listen((e)=>window.alert('confirmed!'));
```
##13:流程控制语句
```dart
// 1: 不会有javascript中存在的问题
var callbacks = [];
for (var i = 0; i < 3; i++) {
  callbacks.add(() => print(i));
}
callbacks.forEach((c) => c()); // 0 1 2
// 2: switch
var commond = 'closed';
switch (commond) {
  case 'closed':
  executeClosed();
  continue nowClosed;
nowClosed:
  case 'now_closed':
  executeNowClosed();
  break;
}

// 3:断言，assert，如果条件表达式结果不满足需要，则可以使用 assert 语句打断代码的 执行。
// assert 方法的参数可以为任何返回布尔值的表达式或者方法。 
// 如果返回的值为true，断言执行通过，执行结束。 如果返回值为 false， 断言执行失败，会抛出一个异常

// 确保next不等于null
assert(next != null);
// 确保number小于100
assert(number < 100);
```
##14:异常(Exceptions)