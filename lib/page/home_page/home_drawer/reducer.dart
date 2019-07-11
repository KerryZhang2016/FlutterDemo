import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeDrawerState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeDrawerState>>{
      HomeDrawerAction.updateGroupState: _updateGroupState,
    },
  );
}

HomeDrawerState _updateGroupState(HomeDrawerState state, Action action) {
  final HomeDrawerState newState = state.clone()
    ..allGroupCount = action.payload;
  return newState;
}
