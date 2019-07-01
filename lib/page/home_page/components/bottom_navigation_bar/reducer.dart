import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CustomBottomNavigationBarState> buildReducer() {
  return asReducer(
    <Object, Reducer<CustomBottomNavigationBarState>>{
      CustomBottomNavigationBarAction.indexChange: _indexChange,
    },
  );
}

CustomBottomNavigationBarState _indexChange(CustomBottomNavigationBarState state, Action action) {
  return  state.clone()
    ..currentIndex = action.payload;
}
