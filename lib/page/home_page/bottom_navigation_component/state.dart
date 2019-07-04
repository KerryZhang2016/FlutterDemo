import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

class CustomBottomNavigationBarState
    implements Cloneable<CustomBottomNavigationBarState> {
  int currentIndex = 0;
  List<String> tabTextList;
  List<AssetImage> tabIconList;
  List<AssetImage> tabIconSelectList;

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
    List<AssetImage> tabIconList,
    List<AssetImage> tabIconSelectList) {
  return CustomBottomNavigationBarState()
    ..currentIndex = 0
    ..tabTextList = tabTextList
    ..tabIconList = tabIconList
    ..tabIconSelectList = tabIconSelectList;
}
