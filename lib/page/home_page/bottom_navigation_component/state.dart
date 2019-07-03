import 'package:fish_redux/fish_redux.dart';

class CustomBottomNavigationBarState
    implements Cloneable<CustomBottomNavigationBarState> {
  int currentIndex = 0;
  List<String> tabTextList;
  List<String> tabIconList;
  List<String> tabIconSelectList;

  @override
  CustomBottomNavigationBarState clone() {
    return CustomBottomNavigationBarState()
      ..currentIndex = 0
      ..tabTextList = tabTextList
      ..tabIconList = tabIconList
      ..tabIconSelectList = tabIconSelectList;
  }
}

CustomBottomNavigationBarState initCustomBottomNavigationBarState(
    List<String> tabTextList,
    List<String> tabIconList,
    List<String> tabIconSelectList) {
  return CustomBottomNavigationBarState()
    ..currentIndex = 0
    ..tabTextList = tabTextList
    ..tabIconList = tabIconList
    ..tabIconSelectList = tabIconSelectList;
}
