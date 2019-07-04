import 'package:fish_redux/fish_redux.dart';

enum MarketAction { pageIndexChange }

class MarketActionCreator {
  static Action pageIndexChange(int index) {
    return Action(MarketAction.pageIndexChange, payload: index);
  }
}
