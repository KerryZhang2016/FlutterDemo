import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/dimen/CustomDimen.dart';
import 'package:test_app/common/style/image/CustomImage.dart';
import 'package:test_app/widget/TapBox.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SafeArea(
        child: IndexedStack(
            index: state.customBottomNavigationBarState.currentIndex,
            children: <Widget>[
          viewService.buildComponent("market"),
          viewService.buildComponent("discover"),
          viewService.buildComponent("trade"),
          viewService.buildComponent("user"),
        ])),
    bottomNavigationBar:
        viewService.buildComponent("customBottomNavigationBar"),
    drawer: state.drawerEnable ? _buildDrawer() : null
  );
}

Widget _buildDrawer() {
  return SizedBox(
    width: 180,
    child: Drawer(
      child: Container(
        color: Color(CustomColor.item_normal_bg_color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 83),
              child: TapBox(
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: const Image(
                          image: AssetImage(CustomImage.market_manage_group),
                          width: 15,
                          height: 15,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          "Manage Group",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(CustomColor.main_text_color),
                              fontSize: CustomDimen.text_size_large,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 23, left: 14),
              child: Text(
                "System Group",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(CustomColor.secondary_text_color),
                    fontSize: CustomDimen.text_size_micro),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TapBox(
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: const Image(
                          image: AssetImage(CustomImage.market_group_all),
                          width: 13,
                          height: 10,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6),
                        child: Text(
                          "All(0)",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(CustomColor.main_text_color),
                              fontSize: CustomDimen.text_size_medium,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: TapBox(
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: const Image(
                          image: AssetImage(CustomImage.market_group_position),
                          width: 13,
                          height: 10,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          "Position(0)",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(CustomColor.main_text_color),
                              fontSize: CustomDimen.text_size_medium,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
