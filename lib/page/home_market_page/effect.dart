import 'package:fish_redux/fish_redux.dart';
import 'package:dio/dio.dart';
import 'package:test_app/common/lifecycle/app_lifecycle.dart';
import 'package:test_app/http/http.dart';
import 'package:test_app/http/model/Watchlist.dart';
import 'action.dart';
import 'state.dart';
import 'dart:convert';

Effect<MarketState> buildEffect() {
  return combineEffects(<Object, Effect<MarketState>>{
    Lifecycle.initState: _initState,
    Lifecycle.build: _build,
    Lifecycle.didUpdateWidget: _didUpdateWidget,
    Lifecycle.deactivate: _deactivate,
    Lifecycle.disappear: _disappear,
    Lifecycle.dispose: _dispose,
    AppLifecycle.state: _onAppLifecycle,
  });
}

void _initState(Action action, Context<MarketState> ctx) async {
  subscribleAppStateChange(ctx);
  try {
    Response response = await dio.get(watchlistPath,
        queryParameters: {"group": "0", "market": "US", "lite": false});
    WatchlistResponse watchlistResponse =
        WatchlistResponse.fromJson(json.decode(response.toString()));
    print(watchlistResponse.items.toString());
    ctx.dispatch(MarketActionCreator.refreshWatchlist(watchlistResponse.items));
  } catch (e) {
    print(e);
  }
}

void _build(Action action, Context<MarketState> ctx) {
  println("Market Page _build");
}

void _didUpdateWidget(Action action, Context<MarketState> ctx) {
  println("Market Page _didUpdateWidget");
}

void _deactivate(Action action, Context<MarketState> ctx) {
  println("Market Page _deactivate");
}

void _disappear(Action action, Context<MarketState> ctx) {
  println("Market Page _disappear");
}

void _dispose(Action action, Context<MarketState> ctx) {
  println("Market Page _dispose");
}

void _onAppLifecycle(Action action, Context<Object> ctx) {
  println("Market Page _onAppLifecycle ${action.payload}");
}

