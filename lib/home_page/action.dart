import 'package:fish_redux/fish_redux.dart';

enum HomeAction {
  indexChange,
}

class HomeActionCreator {

  static Action indexChange(int index) {
    return Action(HomeAction.indexChange, payload: index);
  }
}
