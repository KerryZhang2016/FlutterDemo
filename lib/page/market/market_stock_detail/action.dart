import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum StockDetailAction { action }

class StockDetailActionCreator {
  static Action onAction() {
    return const Action(StockDetailAction.action);
  }
}
