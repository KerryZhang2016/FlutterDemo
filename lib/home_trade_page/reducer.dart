import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TradeState> buildReducer() {
  return asReducer(
    <Object, Reducer<TradeState>>{
      TradeAction.action: _onAction,
    },
  );
}

TradeState _onAction(TradeState state, Action action) {
  final TradeState newState = state.clone();
  return newState;
}
