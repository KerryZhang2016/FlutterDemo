import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/http.dart';
import 'package:test_app/http/model/Watchlist.dart';
import 'package:test_app/utils/log_util.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeDrawerState> buildEffect() {
  return combineEffects(<Object, Effect<HomeDrawerState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,

    HomeDrawerAction.onUpdateGroupState: _onUpdateGroupState,
  });
}

void _initState(Action action, Context<HomeDrawerState> ctx) {
  LogUtil.loggerLevelD("Home Drawer _initState");
  ctx.dispatch(HomeDrawerActionCreator.onUpdateGroupState());
}

void _dispose(Action action, Context<HomeDrawerState> ctx) {
  LogUtil.loggerLevelD("Home Drawer _dispose");
}

void _onUpdateGroupState(Action action, Context<HomeDrawerState> ctx) async {
  try {
    Response response = await dio.get(watchlistPath,
        queryParameters: {"group": "0", "market": "US", "lite": false});
    WatchlistResponse watchlistResponse =
    WatchlistResponse.fromJson(json.decode(response.toString()));
    ctx.dispatch(HomeDrawerActionCreator.updateGroupState(watchlistResponse.items.length));
  } catch (e) {
    LogUtil.loggerLevelE(e);
  }
}


