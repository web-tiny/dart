```dart
/*
 * @Author: tiny.jiao@aliyun.com 
 * @Date: 2019-09-18 21:30:19 
 * @Last Modified by: tiny.jiao@aliyun.com
 * @Last Modified time: 2019-09-18 23:33:54
 */
```
##dart语言特点总结
####1:定义变量的方式
>1: var/final/const/int/String/
####2:Numbers
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
####3:Strings
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
####4:Booleans
```dart
// 当dart需要一个布尔值的时候，只有true对象才被认为是true，所有其他的值都是false,其实这样设计也挺好，可以规避一些奇怪的行为
var name = 'Blob';
if(name){
  // prints in javascript,not in dart
  print('You have a name!');
}
```
####5:Lists
```dart
// dart list就是js中array
// 常量数组
var constList = const [1, 2, 3];
```
####6:Maps
```dart
// 跟ES6的Map一样的用法
```