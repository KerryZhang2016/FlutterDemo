import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/dimen/CustomDimen.dart';

import 'state.dart';

Widget buildView(
    MarketState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Container(
          height: 42,
          color: Colors.white,
          child: Center(
            child: Text(
              'Markets',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(CustomColor.main_text_color),
                  fontSize: CustomDimen.text_size_tall_23,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: state.pageController,
            children: <Widget>[
              viewService.buildComponent("Watchlist"),
              viewService.buildComponent("USMarket"),
            ],
          ),
        )
      ],
    ),
  );
}
