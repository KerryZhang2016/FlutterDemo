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
        Container(
          width: double.infinity,
          height: 23,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 14,
                child: Container(
                  height: 23,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("All",
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
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 14,
                child: Container(
                  height: 23,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Chg%",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(CustomColor.secondary_text_color),
                              fontSize: CustomDimen.text_size_tiny)),
                      Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Image(
                            image: AssetImage(CustomImage.market_sort_default),
                            width: 6.0,
                            height: 10.0,
                          )
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 123,
                child: Container(
                  height: 23,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Price",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(CustomColor.secondary_text_color),
                              fontSize: CustomDimen.text_size_tiny)),
                      Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Image(
                            image: AssetImage(CustomImage.market_sort_default),
                            width: 6.0,
                            height: 10.0,
                          )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(color: Color(CustomColor.divider_color), height: 1),
        Expanded(
            child: ListView.builder(
                itemBuilder: adapter.itemBuilder,
                itemCount: adapter.itemCount))
      ],
    ),
  ));
}
