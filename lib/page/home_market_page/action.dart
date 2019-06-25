import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/model/Watchlist.dart';

enum MarketAction { refreshWatchlist }

class MarketActionCreator {
  static Action refreshWatchlist(List<WatchlistItem> payload) {
    return Action(MarketAction.refreshWatchlist, payload: payload);
  }
}
