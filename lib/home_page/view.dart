import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
    appBar: AppBar(
      title: Text(state.selectedIndex.toString()),
    ),
    body: TabBarView(controller: state.tabController, children: <Widget>[
      viewService.buildComponent("market"),
      viewService.buildComponent("discover"),
      viewService.buildComponent("trade"),
      viewService.buildComponent("user"),
    ],),
    bottomNavigationBar: Material(
      color: Colors.white,
      child: SafeArea(
          child: Container(
            height: 65.0,
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
              labelColor: Theme.of(viewService.context).primaryColor,
              unselectedLabelColor: const Color(0xFF8E8E8E),
              tabs: state.tabs,
            ),
          ),
      ),
    ),
  );
}
