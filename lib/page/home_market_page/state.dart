import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/page/home_market_page/us_market_page/state.dart';
import 'package:test_app/page/home_market_page/watchlist_page/state.dart';

class MarketState implements Cloneable<MarketState> {

  PageController pageController;

  WatchlistState watchlistState;
  USMarketState usMarketState;

  @override
  MarketState clone() {
    return MarketState()
      ..pageController = pageController
      ..watchlistState = watchlistState
      ..usMarketState = usMarketState;
  }
}

MarketState initMarketState(String args) {
  return MarketState()
    ..pageController = PageController()
    ..watchlistState = initWatchlistState(null)
    ..usMarketState = initUSMarketState(null);
}

class WatchlistConnector extends ConnOp<MarketState, WatchlistState> {
  @override
  WatchlistState get(MarketState state) {
    return state.watchlistState;
  }

  @override
  void set(MarketState state, WatchlistState subState) {
    state.watchlistState = subState;
  }
}


class USMarketConnector extends ConnOp<MarketState, USMarketState> {
  @override
  USMarketState get(MarketState state) {
    return state.usMarketState;
  }

  @override
  void set(MarketState state, USMarketState subState) {
    state.usMarketState = subState;
  }
}
