import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/utils/log_util.dart';

import 'action.dart';
import 'state.dart';

Reducer<WatchlistState> buildReducer() {
  return asReducer(
    <Object, Reducer<WatchlistState>>{
      WatchlistAction.refreshWatchlist: _refreshWatchlist,
      WatchlistAction.updateSort: _updateSort,
      WatchlistAction.updateGroup: _updateGroup,
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

WatchlistState _updateSort(WatchlistState state, Action action) {
  WatchlistState watchlistState = state.clone();
  int clickSortIndex = action.payload;
  if (watchlistState.sortIndex != clickSortIndex) {
    watchlistState.sortIndex = clickSortIndex;
    watchlistState.sortState = 1;
  } else {
    watchlistState.sortState = (watchlistState.sortState + 1) % 3;
  }
  return watchlistState;
}

WatchlistState _updateGroup(WatchlistState state, Action action) {
  WatchlistState watchlistState = state.clone()
    ..currentGroup = action.payload;
  return watchlistState;
}

