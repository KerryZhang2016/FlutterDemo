import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/dimen/CustomDimen.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(StockDetailState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Color(CustomColor.item_normal_bg_color),
    child: Center(
      child: Text(
        'Markets',
        style: TextStyle(
            fontFamily: 'Roboto',
            color: Color(CustomColor.main_text_color),
            fontSize: CustomDimen.text_size_tall_23,
            fontWeight: FontWeight.w800),
      ),
    ),
  );
}
