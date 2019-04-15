import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TradeAction { action }

class TradeActionCreator {
  static Action onAction() {
    return const Action(TradeAction.action);
  }
}
