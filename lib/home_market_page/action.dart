import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MarketAction { action }

class MarketActionCreator {
  static Action onAction() {
    return const Action(MarketAction.action);
  }
}
