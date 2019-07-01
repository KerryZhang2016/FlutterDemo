import 'package:fish_redux/fish_redux.dart';

enum CustomBottomNavigationBarAction {
  indexChange
}

class CustomBottomNavigationBarActionCreator {
  static Action indexChange(int index) {
    return Action(CustomBottomNavigationBarAction.indexChange, payload: index);
  }
}
