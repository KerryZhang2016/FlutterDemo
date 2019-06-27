import 'package:fish_redux/fish_redux.dart';
import 'package:dio/dio.dart';
import 'package:test_app/common/lifecycle/app_lifecycle.dart';
import 'package:test_app/http/http.dart';
import 'package:test_app/http/model/Watchlist.dart';
import 'package:test_app/utils/logger.dart';
import 'action.dart';
import 'state.dart';
import 'dart:convert';

Effect<MarketState> buildEffect() {
  return combineEffects(<Object, Effect<MarketState>>{
    Lifecycle.initState: _initState,
    Lifecycle.didChangeDependencies: _didChangeDependencies,
    Lifecycle.build: _build,
    Lifecycle.reassemble: _reassemble,
    Lifecycle.didUpdateWidget: _didUpdateWidget,
    Lifecycle.deactivate: _deactivate,
    Lifecycle.dispose: _dispose,
    AppLifecycle.state: _onAppLifecycle,
  });
}

void _initState(Action action, Context<MarketState> ctx) async {
  loggerLevelI("Market Page _initState");
  subscribleAppStateChange(ctx);
  try {
    Response response = await dio.get(watchlistPath,
        queryParameters: {"group": "0", "market": "US", "lite": false});
    WatchlistResponse watchlistResponse =
        WatchlistResponse.fromJson(json.decode(response.toString()));
    loggerLevelD(watchlistResponse.items.toString());
    ctx.dispatch(MarketActionCreator.refreshWatchlist(watchlistResponse.items));
  } catch (e) {
    loggerLevelE(e);
  }
}

void _didChangeDependencies(Action action, Context<MarketState> ctx) {
  loggerLevelI("Market Page _didChangeDependencies");
}

void _build(Action action, Context<MarketState> ctx) {
  loggerLevelI("Market Page _build");
}

void _reassemble(Action action, Context<MarketState> ctx) {
  loggerLevelI("Market Page _reassemble");
}

void _didUpdateWidget(Action action, Context<MarketState> ctx) {
  loggerLevelI("Market Page _didUpdateWidget");
}

void _deactivate(Action action, Context<MarketState> ctx) {
  loggerLevelI("Market Page _deactivate");
}

void _dispose(Action action, Context<MarketState> ctx) {
  loggerLevelI("Market Page _dispose");
}

void _onAppLifecycle(Action action, Context<Object> ctx) {
  loggerLevelW("Market Page _onAppLifecycle ${action.payload}");
}
