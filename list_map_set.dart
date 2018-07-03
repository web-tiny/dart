import 'dart:math';
import 'dart:typed_data';
void main() {
  /**
   * 数组
   */
  // (创建固定长度的数组)
  List<int> fixedLengthList = new List(5);
  fixedLengthList[0] = 84;
  print(fixedLengthList);
  print(fixedLengthList[0]);

  List<int> list = [1,2];
  print(list);

  /**
   * 增加操作
   */
  // （末尾添加）
  list.add(88);
  print(list);
  // （指定位置添加）
  list.insert(2, 90);
  // （添加整个列表）
  list.addAll([88,90]);
  print(list);
  // 添加整个列表到指定下标
  list.insertAll(2, [22, 66]);
  print(list);

  /**
   * 删除操作
   */
  // 根据值删除(匹配的第一个)
  list.remove(88);
  // 删除最后一个
  list.removeLast();
  print(list);
  // 根据索引删除
  list.removeAt(0);
  print(list);
  // 删除所有元素
  // list.clear();
  // print(list);
  // list.removeRange(start, end) 不包括end
  list.removeRange(0, 2);
  print(list); // [66, 90, 88]
  // list.replaceRange(start, end, element) 不包括end
  list.replaceRange(0, 2, [33, 44, 55]);
  print(list); // [33, 44, 55, 88]
  // 删除所有不满足条件的值，返回满足条件的新数组
  // list.retainWhere((item) => item == 55);
  // print(list); // [55]

  /**
   * 改
   */
  // 从第几个元素开始覆盖
  list.setAll(0, [66, 77]);
  print(list); // [66, 77, 55, 88]
  // list.setRange(start,end,ele) 不包括end
  list.setRange(2, 3, [99, 11]);
  print(list); // [66, 77, 99, 88]
  // 对数组进行随机排序
  list.shuffle();
  print(list); // [88, 66, 99, 77]

  /**
   * 查
   */
  // 是否包含指定元素
  print(list.contains(22)); // false
  // 返回列表中的第几个元素
  print(list.elementAt(0)); // 66
  // 返回列表中第一个匹配元素的下标
  print(list.indexOf(77)); // 2
  // 返回列表中最后一个匹配元素的下标
  print(list.lastIndexOf(99)); // 1
  // 返回开始下标到结束下标的元素列表
  print(list.sublist(0, 2)); // [66, 99]
  // 返回开始下标到最后一个元素列表
  print(list.sublist(1)); // [88, 99, 66]

  /**
   * 遍历数组
   */
  list.forEach((value) => print(value));
  
  /**
   * 数组常用方法
   */
  // 列表的字符串表示
  print(list.toString()); // [66, 88, 99, 77]
  // 列表的集表示
  print(list.toSet()); // {66, 88, 99, 77}
  // 列表的列表表示
  print(list.toList()); // [66, 88, 99, 77]
  // 用指定字符连接列表元素
  print(list.join(',')); // 66,88,99,77
  // 数组排序
  list.sort((a, b) => a.compareTo(b));
  print(list); // [66, 77, 88, 99]
  // var listUpperCaseValue = list.map((number) => number.toUpperCase());
  // listUpperCaseValue.forEach(print);
  bool isDecaffeinated(num number) => number == '99';
  list.where((number) => isDecaffeinated(number));
  print(list.any(isDecaffeinated));
  print(list.every(isDecaffeinated));

  /**
   * Map(映射)
   */
  Map<String, int> map = {'age': 55,'height': 188};
  // map所有属性
  print(map.hashCode); // 212692856
  print(map.isEmpty); // false
  print(map.isNotEmpty); // true
  print(map.keys); // (age, height)
  print(map.values); // (55, 188)
  print(map.length); // 2
  print(map.runtimeType); // _InternalLinkedHashMap

  // map常用方法
  print(map.toString()); // {age: 55, height: 188}
  map.addAll({'width': 28,'wight':80});
  print(map); // {age: 55, height: 188, width: 28, wight: 80}
  print(map.containsKey('width')); // true
  print(map.containsValue(28)); // true
  map.remove('age');
  print(map); // {height: 188, width: 28, wight: 80}
  map.forEach((key, value) => print(key + ':' + value.toString()));

  /**
   * Set
   */
  Set sillains = new Set();
  sillains.addAll(['dart','javascript','kotlin','php','java']);

  // Set所有属性
  print(sillains); // {dart, javascript, kotlin, php, java}
  print(sillains.first); // dart
  print(sillains.last); // java
  print(sillains.length); // 5
  print(sillains.isEmpty); // false
  print(sillains.isNotEmpty); // true
  print(sillains.hashCode); // 417128034
  print(sillains.iterator); // Instance of '_CompactIterator'
  print(sillains.runtimeType); // _CompactLinkedHashSet
  // 集只有一个元素就返回元素，否则异常
  Set singleValue = new Set.from(['single']);
  print(singleValue.single); // single

  // Set所有方法
  sillains.add('.net');
  sillains.addAll(['swift-c','c++']);
  print(sillains.toString()); // {dart, javascript, kotlin, php, java, .net, swift-c, c++}
  print(sillains.join('-')); // dart-javascript-kotlin-php-java-.net-swift-c-c++
  print(sillains.contains('c')); // false
  print(sillains.containsAll(['C++','php'])); // false
  print(sillains.elementAt(2)); // kotlin
  // 删除成功返回true,删除失败返回false
  print(sillains.remove('js')); // false
  // 返回删除后的新数组
  sillains.removeAll(['kotlin','java']); 
  print(sillains); // {dart, javascript, php, .net, swift-c, c++}
  // var nobleGases = Set.from(['编译原理', '计算机操作系统']);
  // list.intersection(nobleGases);
  sillains.clear();
  print(sillains); // {}
}