import 'package:fish_redux/fish_redux.dart';

class HomeDrawerState implements Cloneable<HomeDrawerState> {

  int allGroupCount = 0;
  int currentGroup = 0;// 当前的分组，0为All，1为Position

  @override
  HomeDrawerState clone() {
    return HomeDrawerState()
      ..allGroupCount = allGroupCount
      ..currentGroup = currentGroup;
  }
}

HomeDrawerState initHomeDrawerState(Map<String, dynamic> args) {
  return HomeDrawerState()
    ..allGroupCount = 0
    ..currentGroup = 0;
}
