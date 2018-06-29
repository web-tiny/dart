import 'dart:html';
import './generics.dart' show SomeBaseClass; // 仅导入SomeBaseClass
import './class.dart' hide Color; // 导入除了Color的其他所有
import './function_operators_exceptions.dart' deferred as FOE; // 延迟加载

void main() {

}
/**
 * Using libraries
 * 延迟加载库:允许应用程序按需加载库,使用延迟加载的场景：
 *  1:减少应用程序的初始启动时间
 *  2:执行A / B测试 - 试用算法的其他实现
 *  3:加载很少使用的功能，例如可选的屏幕和对话框。
 * 
 * 
 */
greet() async {
  // 使用await让其同步
  await FOE.playerName('name');
  FOE.makeAdder(9);
}