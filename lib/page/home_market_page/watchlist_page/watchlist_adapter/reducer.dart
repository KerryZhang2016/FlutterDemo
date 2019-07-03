import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';

Reducer<WatchlistState> buildReducer() {
  return asReducer(
    <Object, Reducer<WatchlistState>>{
      WatchlistListAdapterAction.action: _onAction,
    },
  );
}

WatchlistState _onAction(WatchlistState state, Action action) {
  final WatchlistState newState = state.clone();
  return newState;
}
