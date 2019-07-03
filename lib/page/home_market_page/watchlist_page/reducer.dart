import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/utils/log_util.dart';

import 'action.dart';
import 'state.dart';

Reducer<WatchlistState> buildReducer() {
  return asReducer(
    <Object, Reducer<WatchlistState>>{
      WatchlistAction.refreshWatchlist: _refreshWatchlist,
    },
  );
}

WatchlistState _refreshWatchlist(WatchlistState state, Action action) {
  LogUtil.loggerLevelD("WatchlistPage reducer _refreshWatchlist ${action.payload}");
  WatchlistState watchlistState = state.clone()
    ..items = action.payload;
  LogUtil.loggerLevelD("WatchlistPage reducer _refreshWatchlist ${watchlistState.items.length}");
  return watchlistState;
}