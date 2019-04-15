import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.indexChange: _indexChange,
    },
  );
}

HomeState _indexChange(HomeState state, Action action) {
  return state.clone()
    ..selectedIndex = action.payload;
}

