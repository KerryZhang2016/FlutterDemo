import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/dimen/CustomDimen.dart';
import 'package:test_app/common/style/image/CustomImage.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    WatchlistState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  final Completer<void> completer = Completer<void>();

  return Container(
      child: RefreshIndicator(
    onRefresh: () async {
      dispatch(WatchlistActionCreator.onRefresh(() {
        completer.complete();
      }));
      return completer.future;
    },
    child: Column(
      children: <Widget>[
        _buildWatchlistHeader(state, dispatch, viewService),
        Divider(color: Color(CustomColor.divider_color), height: 1),
        Expanded(
            child: adapter.itemCount == 0
                ? _buildEmptyView(viewService)
                : ListView.builder(
                    itemBuilder: adapter.itemBuilder,
                    itemCount: adapter.itemCount))
      ],
    ),
  ));
}

Widget _buildEmptyView(ViewService viewService) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => {Scaffold.of(viewService.context).openDrawer()},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 20, top: 90),
            child: Image(
              image: AssetImage(CustomImage.market_watchlist_empty_add),
              width: 36.0,
              height: 36.0,
            )),
        Text("Your watchlist is empty\nTap here to add stocks",
            style: TextStyle(
                fontFamily: 'Roboto',
                color: Color(CustomColor.secondary_text_color),
                fontSize: CustomDimen.text_size_micro)),
      ],
    ),
  );
}

Widget _buildWatchlistHeader(
    WatchlistState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 23,
    width: double.infinity,
    child: Stack(
      children: <Widget>[
        Positioned(
          left: 10,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => {Scaffold.of(viewService.context).openDrawer()},
            child: Container(
              height: 23,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: <Widget>[
                  Text(state.currentGroup == 0 ? "All" : "Position",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(CustomColor.secondary_text_color),
                          fontSize: CustomDimen.text_size_tiny)),
                  Container(
                      margin: EdgeInsets.only(left: 3),
                      child: Image(
                        image: AssetImage(CustomImage.market_group_expand),
                        width: 5.0,
                        height: 7.0,
                      )),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => {dispatch(WatchlistActionCreator.updateSort(2))},
            child: Container(
              height: 23,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: <Widget>[
                  Text("Chg%",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(CustomColor.secondary_text_color),
                          fontSize: CustomDimen.text_size_tiny)),
                  Container(
                      margin: EdgeInsets.only(left: 3),
                      child: Image(
                        image: AssetImage(_getChgSortImg(state)),
                        width: 6.0,
                        height: 10.0,
                      )),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 118,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => {dispatch(WatchlistActionCreator.updateSort(1))},
            child: Container(
              height: 23,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: <Widget>[
                  Text("Price",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(CustomColor.secondary_text_color),
                          fontSize: CustomDimen.text_size_tiny)),
                  Container(
                      margin: EdgeInsets.only(left: 3),
                      child: Image(
                        image: AssetImage(_getPriceSortImg(state)),
                        width: 6.0,
                        height: 10.0,
                      )),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

String _getPriceSortImg(WatchlistState state) {
  if (state.sortIndex != 1 || state.sortState == 0) {
    return CustomImage.market_sort_default;
  } else if (state.sortState == 1) {
    return CustomImage.market_sort_down;
  } else {
    return CustomImage.market_sort_up;
  }
}

String _getChgSortImg(WatchlistState state) {
  if (state.sortIndex != 2 || state.sortState == 0) {
    return CustomImage.market_sort_default;
  } else if (state.sortState == 1) {
    return CustomImage.market_sort_down;
  } else {
    return CustomImage.market_sort_up;
  }
}
