import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/page/home_market_page/watchlist_page/action.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeDrawerState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeDrawerState>>{
      HomeDrawerAction.updateGroupState: _updateGroupState,
      WatchlistAction.updateGroup: _updateGroup,
    },
  );
}

HomeDrawerState _updateGroupState(HomeDrawerState state, Action action) {
  final HomeDrawerState newState = state.clone()
    ..allGroupCount = action.payload;
  return newState;
}

HomeDrawerState _updateGroup(HomeDrawerState state, Action action) {
  HomeDrawerState watchlistState = state.clone()
    ..currentGroup = action.payload;
  return watchlistState;
}
