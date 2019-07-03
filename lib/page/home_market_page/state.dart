import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/model/Watchlist.dart';

class MarketState implements Cloneable<MarketState> {

  List<WatchlistItem> items;

  @override
  MarketState clone() {
    return MarketState()
      ..items = items;
  }
}

MarketState initMarketState(String args) {
  return MarketState()
    ..items = [];
}
