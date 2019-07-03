import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum USMarketAction { action }

class USMarketActionCreator {
  static Action onAction() {
    return const Action(USMarketAction.action);
  }
}
