void main () {
  print('hello world');
  dynamic name = 'jack';
  print(name);
  printTypes();
}
printTypes () {
  var age = '33';
  const addr = 'china';
  final tellphone = '888';
  final String nickname = 'dulio';

  print(nickname);
  /* final,const用于定义常量，不能再次赋值
  * dart types:
  *   numbers
  *   strings
  *   booleans
  *   lists(array)
  *   maps
  *   runes(for expressing Unicode characters in a string)
  *   symbols
  */
  var foo = const [];
  final bar = const [];
  const baz = const [];
  foo = [];

  /* numbers有两种数据类型: int/double  
  *   int/double与String之间的转换如下:
  */
  // String -> int
  var one = int.parse('1');
  assert(one ==1 );

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.13159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  /*  String
  *     使用 ${expression}将表达式插入字符串中
  *     如果表达式是标识符，则{}可以省略
  *   创建多行字符串的方法：
  *     1):使用相邻的字符串文字或者+
  *     2):使用三引号的单引号或者双引号
  */
  var s = 'string interpolation';
  assert('Dart has $s, whick' == 'Dart hans string interpolation, whick');
  assert('That deserves'+'${s.toUpperCase()} is very handy' == 'That deserves STRING INTERPOLATION is very handy');

  // 使用相邻的字符串文字或者+创建多行字符串
  var s1 = 'string'
          'concatenation'
          "works even over line breaks";
  assert(s1 == 'string concatenation works even over line breaks');
  var s2 = 'the operator'+
          'works,as well';
  assert(s2 == 'the operator works,as well');

  // 使用三引号的单引号或者双引号创建多行字符串
  var s3 = '''
    you can create multi-line 
    strings like this one.
    ''';
  var s4 = """
    this is alse a 
    multi-line string .""";

  /*  booleans
  *   可以用assert() 代替 if(true){}
  */
  var fullName = '';
  assert(fullName.isEmpty);
  var hitPoints = 0;
  assert(hitPoints <=0);
  var unicorn;
  assert(unicorn == null);

  /*  list as array
  */

  /*  Maps:在dart中map是一个对象
  */
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
  gifts['fourth'] = 'calling birds';
  assert(gifts['fourth'] == 'calling birds');

  var nobleGase = {
    1: 'hello',
    2: 'neon',
    20: 'argon'
  };

  var giftsMap =new Map();
  giftsMap['first'] = 'partridge';
  giftsMap['second'] = 'turtledoves';
  giftsMap['fifth'] = 'golden rings';
  
  var nobleGaseMap =new Map();
  nobleGaseMap[1] = 'hello';
  nobleGaseMap[2] = 'neon';
  nobleGaseMap[10] = 'argon';

  /*  runes:Dart 中 使用runes 来获取UTF-32字符集的字符
  */
  var clapping = '\n{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());
  Runes input = new Runes('\u{2665} \n{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));

  /*  Symbols
  *     Symbols字面量是编译时常量，在标识符前面加#
  */
  print(#ss == new Symbol('ss'));
}