import 'package:fish_redux/fish_redux.dart';

class HomeDrawerState implements Cloneable<HomeDrawerState> {

  int allGroupCount = 0;

  @override
  HomeDrawerState clone() {
    return HomeDrawerState()
      ..allGroupCount = allGroupCount;
  }
}

HomeDrawerState initHomeDrawerState(Map<String, dynamic> args) {
  return HomeDrawerState()
    ..allGroupCount = 0;
}
