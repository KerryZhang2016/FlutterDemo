import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(MarketState state, Dispatch dispatch, ViewService viewService) {
  return new ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        return new ListTile(
          title: new Text('${state.items[index].nameCN}'),
        );
      });
}
