import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

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
    drawer: state.drawerEnable ? viewService.buildComponent("homeDrawer") : null
  );
}
