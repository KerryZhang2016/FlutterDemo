import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<USMarketState> buildReducer() {
  return asReducer(
    <Object, Reducer<USMarketState>>{
      USMarketAction.action: _onAction,
    },
  );
}

USMarketState _onAction(USMarketState state, Action action) {
  final USMarketState newState = state.clone();
  return newState;
}
