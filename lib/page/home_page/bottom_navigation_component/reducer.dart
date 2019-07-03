import 'package:fish_redux/fish_redux.dart';

import 'package:test_app/page/home_page/bottom_navigation_component/action.dart';
import 'package:test_app/page/home_page/bottom_navigation_component/state.dart';

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
