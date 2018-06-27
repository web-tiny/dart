Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}
String topLevel = 'top';

void foo () {}
fooNull () {}
class A {
  static void bar () {}
  void baz () {}
}
/*  the main() function:
*   every app must have a top-level main() function,which serves as the entrypoint to the app
*/
void main (List <String> arguments) {
  print(say('Bob', 'Howdy')); // Bob says Howdy
  print(say('Bob', 'Howdy','smoke signal')); // Bob says Howdy with a smoke signal
  print(enableFlags(bold:true));
  doStuff();
  // querySelector('#sample_text_id');
  // ..text = 'click me';
  // ..onClick.listen(reverseText);
  print(arguments);
  assert(arguments.length ==2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
  print(loudify('hello'));

  // Functions as first-class objects
  void printElements(int element) {
    print(element);
  }
  var listNumber = [1, 2, 3];
  // Pass printElements as a parameter
  listNumber.forEach(printElements);

  // Anonymous functions
  var listFood = ['apples', 'bananas', 'oranges'];
  // listFood.forEach( ( item ) {
  //   print('${listFood.indexOf(item)}: $item');
  // });
  listFood.forEach((item) => print('${listFood.indexOf(item)}: $item'));

  // Lexical closures
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);
  assert(add2(3) == 3, 'error');
  assert(add4(3) == 7);

  // Lexical scope
  var insideMain = 'second';
  void myFunction () {
    var insideFunction = 'third';
    void nestedFunction () {
      var insideNestedFunction = 'fourth';
      print(insideMain);
      print(topLevel);
      print(insideFunction);
      print(insideNestedFunction);
    }
    nestedFunction();
  }
  myFunction();

  // Testing functions for equality
  var x;
  // Comparing top-level functions
  x = foo;
  print(foo == x);

  // Comparing static methods
  x = A.bar;
  print(A.bar == x);

  // Comparing instance methods
  var v = new A(); // Instance #1 of A
  var w = new A(); // Instance #2 of A
  var y = w;
  x = w.baz;
  print(y.baz == x);
  print(v.baz == w.baz); // false
  // if no return value is specified,the statement return null
  print(fooNull()); // null

  // Throw
  // throw FormatException('Expected at least 1 section');
  // throw 'out of allamas !';

  /*  the first is the exception that was thrown,and the second is the stack trace
  *   try {
  *  
  *   } on Exceptions catch (e){
  * 
  *   } catch (e, s) { 
  *     
  *   }
  */
  try {
    throw 'out of allamas !';
  } on Exception catch (e) {
    print('Unkown excetion:$e');
  } catch (e, s) {
    print('Something really unknown: $e');
    print('Stack trace: $s');
  }

  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}

String say (String frome, String msg, [String device]) {
  var result = '$frome says $msg';
  if(device != null) {
    result = '$result with a $device';
  }
  return result;
}

// setting default values for named parameters
String enableFlags({bool bold = false,bool hidden = false}) {
  return '$bold $hidden';
}

// using list or maps as default values
void doStuff(
  { List <int> list = const [ 1, 2, 3 ],
    Map <String, String> gifts = const {
      'first':'paper',
      'second': 'cotton',
      'third': 'leather'
    }
  }
){
  print('list：$list');
  print('gifts: $gifts');
}

// =>{} 函数的简洁写法，这点跟ES6的箭头函数很像
var loudify = (msg) => '!! ${msg.toUpperCase()} !!';

/*  Operators
*     as (类型转换)
*     is (如果对象具有指定的类型，则为true)
*     is! (如果对象没有指定的类型，则为false)
*     ?? (if null)
*     .. (联级：对对象的成员执行多个操作)
*     ?.
*     ~expr (按位补码（0成为1；1变成0）)
*     ~/
*/
bool isPublic = true;
// When you need to assign a value based on a boolean expression,consider using ? :
var visibility = isPublic ? 'public': 'private';
// if the boolean expression tests for null,consider using ??
String playerName(String name) => name?? 'Guest';

/*  Cascade notation(..)
*/

// final addressBook = (AddressBookBuilder()
//   ..name = 'jenny'
//   ..email = 'jenny@example.com'
//   ..phone = (PoneNumberBuilder()
//     ..number = '415-555-0100'
//     ..label = 'home')
//     .build())
//   .build();

/*  Control flow statements
*     assert(返回布尔值的表达式, second):second只有第一个参数返回true的时候才能继续执行
*       
*/
// for loops
void forLoof () {
  var callbacks = [];
  for ( var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
}

/*  Exceptions
*/
// throw
void distanceTo(String other) => throw UnimplementedError();

void misbehave () {
  try {
    dynamic foo = true;
    print(foo++);
  } catch (e) {
    // using Object's runtimeType property to get an object's type at runtime
    print('misbehave() partially handled ${e.runtimeType}.');
    // Allow callers to see the exception,如果不用rethrow关键字，调用时catch抓不到异常
    rethrow;
  } finally {
    cleanLamasStalls();
  }
}
String cleanLamasStalls () {
  // Always clean up, even if an exception is thrown
  print('this code always runs');
}