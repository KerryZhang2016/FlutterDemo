import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TradeState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Text("Trade"),
  );
}
