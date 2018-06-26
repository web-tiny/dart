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
  assert(add2(3) == 5);
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
  print(v.baz == w.baz);
  // if no return value is specified,the statement return null
  print(fooNull());
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
*/

