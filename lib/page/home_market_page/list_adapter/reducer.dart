import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';

Reducer<MarketState> buildReducer() {
  return asReducer(
    <Object, Reducer<MarketState>>{
      WatchlistListAdapterAction.action: _onAction,
    },
  );
}

MarketState _onAction(MarketState state, Action action) {
  final MarketState newState = state.clone();
  return newState;
}
