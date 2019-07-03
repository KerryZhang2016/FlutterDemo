import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/utils/log_util.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WatchlistState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  final Completer<void> completer = Completer<void>();
  LogUtil.loggerLevelD("WatchlistPage buildView ${adapter.itemCount}");
  LogUtil.loggerLevelD("WatchlistPage buildView ${state.items == null ? 0 : state.items.length}");

  return Container(
    child: RefreshIndicator(
      onRefresh: () async {
        dispatch(WatchlistActionCreator.onRefresh(() {
          completer.complete();
        }));
        return completer.future;
      },
      child: Container(
        child: ListView.builder(
            itemBuilder: adapter.itemBuilder,
            itemCount: adapter.itemCount),
      ),
    ),
  );
}
