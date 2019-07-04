import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/dimen/CustomDimen.dart';

import 'package:test_app/page/home_page/bottom_navigation_component/action.dart';
import 'package:test_app/page/home_page/bottom_navigation_component/state.dart';

Widget buildView(CustomBottomNavigationBarState state, Dispatch dispatch,
    ViewService viewService) {
  return SafeArea(
    child: SizedBox(
      height: 46.0,
      child: Card(
        elevation: Platform.isIOS ? 0.0 : 8.0,
        shape: RoundedRectangleBorder(),
        margin: EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(color: Color(0xFFE0E0E0), height: 0.6),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildBottomItems(state, dispatch)),
            )
          ],
        ),
      ),
    ),
  );
}

List<Widget> _buildBottomItems(
    CustomBottomNavigationBarState state, Dispatch dispatch) {
  var list = List<Widget>();
  for (var i = 0; i < state.tabTextList.length; i++) {
    list.add(_buildBottomItem(state, dispatch, i));
  }
  return list;
}

Widget _buildBottomItem(
    CustomBottomNavigationBarState state, Dispatch dispatch, int index) {
  Widget _wrapInk(bool isInk, Widget child, GestureTapCallback onTap) {
    return isInk
        ? InkResponse(child: child, onTap: onTap)
        : GestureDetector(
            child: Container(
                child: child,
                color: Platform.isIOS ? Colors.transparent : Colors.white),
            onTap: onTap);
  }

  Widget bottomItem = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage(state.currentIndex == index
                ? state.tabIconSelectList[index]
                : state.tabIconList[index]),
            width: 19.0,
            height: 19.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 3.0),
            child: Text(state.tabTextList[index],
                style: TextStyle(
                    color: (state.currentIndex == index)
                        ? Color(CustomColor.home_tab_select_text_color)
                        : Color(CustomColor.home_tab_text_color),
                    fontSize: CustomDimen.text_size_tiny)),
          )
        ],
      )
    ],
  );

  return Expanded(
      child: _wrapInk(false, bottomItem, () {
    dispatch(CustomBottomNavigationBarActionCreator.indexChange(index));
  }));
}
