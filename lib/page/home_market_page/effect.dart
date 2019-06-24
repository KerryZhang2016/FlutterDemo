import 'package:fish_redux/fish_redux.dart';
import 'package:dio/dio.dart';
import 'package:test_app/http/http.dart';
import 'package:test_app/http/model/Watchlist.dart';
import 'action.dart';
import 'state.dart';
import 'dart:convert';

Effect<MarketState> buildEffect() {
  return combineEffects(<Object, Effect<MarketState>>{
    Lifecycle.initState: _initSate,
    MarketAction.action: _onAction,
  });
}

void _initSate(Action action, Context<MarketState> ctx) async {
  try {
    print("Market Page init");
    Response response = await dio.get(watchlistPath,
        queryParameters: {"group": "0", "market": "US", "lite": false});
    WatchlistResponse watchlistResponse =
        WatchlistResponse.fromJson(json.decode(response.toString()));
    print(watchlistResponse.items.toString());
  } catch (e) {
    print(e);
  }
}

void _onAction(Action action, Context<MarketState> ctx) {}
