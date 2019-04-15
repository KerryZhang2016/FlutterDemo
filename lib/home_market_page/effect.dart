import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MarketState> buildEffect() {
  return combineEffects(<Object, Effect<MarketState>>{
    MarketAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MarketState> ctx) {
}
