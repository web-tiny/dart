void main() {
  var someBaseClassFoo = new Foo < SomeBaseClass > ();
  var extenderFoo = new Foo < Extender > ();
  var foo = new Foo();
}
/**
 * 泛型：
 * 使用 <...> 的方式定义泛型
 */
// var names = new List<String>();
// names.addAll(['iterable','kathy','lars']);
// names.add(44);

/**
 * 1:使用泛型提炼代码
 */
abstract class ObjectCache {
  Object getByKey(String key);
  setByKey(String key, Object value);
}
abstract class StringCache {
  String getByKey(String key);
  setByKey(String key, String value);
}
// 上面的代码可以使用泛型简化如下
abstract class cache<T> {
  T getByKey(String key);
  setByKey(String key, T value);
}

/**
 * 2：用于集合类型，让List and Map 类型参数化
 */
var names = <String> ['seth', 'kathy', 'lars'];
var pages = <String, String> {
  'index.html':'Homgepage',
  'robots.txt':'Hints for web robots',
};


/**
 * 3：使用带构造函数的参数化类型：
 * 要在使用构造函数时指定一个或多个类型，请将类型放在类名称后面的尖括号（<...>）中
 */
// var namesTwo = new List<String>();
// namesTwo.addAll(['iterable','kathy','lars']);
// var namesTwoSet = new Set<String>.from(namesTwo);
// var views = new Map<int, View>();

/**
 * 在实现泛型类型时，可以使用扩展来限制其参数的类型
 */
class SomeBaseClass {
  
}
class Foo < T extends SomeBaseClass > {
   
}
class Extender extends SomeBaseClass {
  
}

// what's the fuck ？？
T first <T>(List<T> ts) {
  T tmp = ts[0];
  return tmp;
}