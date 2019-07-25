import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<StockDetailState> buildEffect() {
  return combineEffects(<Object, Effect<StockDetailState>>{
    StockDetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<StockDetailState> ctx) {
}
