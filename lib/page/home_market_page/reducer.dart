import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MarketState> buildReducer() {
  return asReducer({
    MarketAction.refreshWatchlist: _refreshWatchlist,
  });
}

MarketState _refreshWatchlist(MarketState state, Action action) {
  return state.clone()
    ..items = action.payload;
}
