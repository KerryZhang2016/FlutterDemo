import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/page/home_page/bottom_navigation_component/action.dart';

import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      CustomBottomNavigationBarAction.indexChange: _indexChange,
    },
  );
}

HomeState _indexChange(HomeState state, Action action) {
  return  state.clone()
    ..drawerEnable = action.payload == 0;
}
