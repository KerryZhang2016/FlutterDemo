import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_app/widget/TopAreaWidget.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
    body: TopAreaWidget(child: TabBarView(controller: state.tabController, children: <Widget>[
      viewService.buildComponent("market"),
      viewService.buildComponent("discover"),
      viewService.buildComponent("trade"),
      viewService.buildComponent("user"),
    ], physics: NeverScrollableScrollPhysics())),
    bottomNavigationBar: Material(
      color: Colors.white,
      child: SafeArea(
          child: Container(
            height: 46.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFd0d0d0),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  offset: Offset(-1.0, -1.0),
                ),
              ]
            ),
            child: TabBar(
              controller: state.tabController,
              tabs: buildTabBar(state),
              indicatorColor: Colors.transparent,
            ),
          ),
      ),
    ),
  );
}

List<Widget> buildTabBar(HomeState homeState) {
  List<Widget> result = List(4);
  for (int i = 0; i < 4; i++) {
    if (homeState.selectedIndex == i) {
      result[i] = homeState.selectTabs[i];
    } else {
      result[i] = homeState.tabs[i];
    }
  }
  return result;
}
