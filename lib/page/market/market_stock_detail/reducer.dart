import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<StockDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<StockDetailState>>{
      StockDetailAction.action: _onAction,
    },
  );
}

StockDetailState _onAction(StockDetailState state, Action action) {
  final StockDetailState newState = state.clone();
  return newState;
}
