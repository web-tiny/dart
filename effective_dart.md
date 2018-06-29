## Dart 书写规范

> ##### 一: 标识符的写法规范
>
> (类，类型定义，枚举，类型参数的名称)
> 1: UpperCameCase
> (常量)
> 2: lowerCameCase
> (库，源文件名称，import导入的前缀)
> 3: lowercase_with_underscores

> ##### 二: 导入导出顺序：系统，包，二级包，按字母顺序，最后再导出
```dart
  import 'dart:async';
  import 'dart:html';

  import 'package:bar/bar.dart';
  import 'package:foo/foo.dart';

  import 'package:my_package/util.dart';

  import 'foo/foo.dart';
  import 'foo.dart';

  export 'src/error.dart';
```
> ##### 三: 使用dartfmt格式化你的dart代码

> ##### 四: 对所有流程都使用花括号

> ##### 五: 注释
>
> 1：注释的首字母大写
> 2：不将块注释放在文档中
> 3：文档注释：使用文档注释而不是常规评论可以让dartdoc找到它并为其生成文档
> 4：当有多行注释的时候，首行的概要注释后空一行
>
> ```dart
> greet(name) {
>   // Assume we have a valid name
>   print('Hi, $name!);
> }
> /// The number of characters in this chunk when unsplit
> int get length => ...
> /// Deletes the file at [path].
> ///
> /// Throws an [IOError] if the file could not be found. Throws a
> /// [PermissionError] if the file is present but could not be deleted.
> void delete(String path) => ...
> ```