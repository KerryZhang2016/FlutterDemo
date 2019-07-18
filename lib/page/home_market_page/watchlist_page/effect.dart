import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/http.dart';
import 'package:test_app/http/model/Watchlist.dart';
import 'package:test_app/utils/log_util.dart';
import '../action.dart';
import 'action.dart';
import 'state.dart';

Effect<WatchlistState> buildEffect() {
  return combineEffects(<Object, Effect<WatchlistState>>{
    WatchlistAction.onRefresh: _onRefresh,
    WatchlistAction.onRefreshWatchlist: _onRefreshWatchlist,
    Lifecycle.initState: _initState,
  });
}

void _onRefresh(Action action, Context<WatchlistState> ctx) async {
  ctx.dispatch(MarketActionCreator.progress(true, 0));
  try {
    Response response = await dio.get(watchlistPath,
        queryParameters: {"group": "0", "market": "US", "lite": false});
    WatchlistResponse watchlistResponse =
        WatchlistResponse.fromJson(json.decode(response.toString()));
    watchlistResponse.updateIndex();
    LogUtil.loggerLevelD(watchlistResponse.items.toString());
    ctx.dispatch(WatchlistActionCreator.refreshWatchlist(watchlistResponse.items));
  } catch (e) {
    LogUtil.loggerLevelE(e);
  }
  ctx.dispatch(MarketActionCreator.progress(false, 0));
  (action.payload as Function())();
}

void _onRefreshWatchlist(Action action, Context<WatchlistState> ctx) async {
  ctx.dispatch(MarketActionCreator.progress(true, 0));
  try {
    Response response = await dio.get(watchlistPath,
        queryParameters: {"group": "0", "market": "US", "lite": false});
    WatchlistResponse watchlistResponse =
        WatchlistResponse.fromJson(json.decode(response.toString()));
    watchlistResponse.updateIndex();
    LogUtil.loggerLevelD(watchlistResponse.items.toString());
    ctx.dispatch(WatchlistActionCreator.refreshWatchlist(watchlistResponse.items));
  } catch (e) {
    LogUtil.loggerLevelE(e);
  }
  ctx.dispatch(MarketActionCreator.progress(false, 0));
}

void _initState(Action action, Context<WatchlistState> ctx) async {
  LogUtil.loggerLevelI("Watchlist Page _initState");
  ctx.dispatch(WatchlistActionCreator.onRefreshWatchlist());
}
