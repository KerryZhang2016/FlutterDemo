import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TradeState> buildEffect() {
  return combineEffects(<Object, Effect<TradeState>>{
    TradeAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TradeState> ctx) {
}
