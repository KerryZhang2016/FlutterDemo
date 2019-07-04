import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MarketState> buildReducer() {
  return asReducer({
    MarketAction.pageIndexChange: _pageIndexChange,
  });
}

MarketState _pageIndexChange(MarketState state, Action action) {
  final MarketState newState = state.clone()
    ..currentIndex = action.payload;
  return newState;
}
