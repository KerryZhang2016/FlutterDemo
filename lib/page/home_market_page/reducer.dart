import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MarketState> buildReducer() {
  return asReducer({
    MarketAction.pageIndexChange: _pageIndexChange,
    MarketAction.progress: _progress,
  });
}

MarketState _pageIndexChange(MarketState state, Action action) {
  final MarketState newState = state.clone()
    ..currentIndex = action.payload;
  return newState;
}

MarketState _progress(MarketState state, Action action) {
  ProgressAction progressAction = action.payload;
  final MarketState newState = state.clone();
  if (newState.currentIndex == progressAction.pageIndex) {
    newState.progressing = progressAction.progressing;
  }
  return newState;
}
