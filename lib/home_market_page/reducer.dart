import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MarketState> buildReducer() {
  return asReducer(
    <Object, Reducer<MarketState>>{
      MarketAction.action: _onAction,
    },
  );
}

MarketState _onAction(MarketState state, Action action) {
  final MarketState newState = state.clone();
  return newState;
}
