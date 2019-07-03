import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/model/Watchlist.dart';

enum MarketAction { onRefreshWatchlist, refreshWatchlist, onRefresh }

class MarketActionCreator {
  static Action onRefreshWatchlist() {
    return Action(MarketAction.onRefreshWatchlist);
  }

  static Action refreshWatchlist(List<WatchlistItem> payload) {
    return Action(MarketAction.refreshWatchlist, payload: payload);
  }

  static Action onRefresh(dynamic payload) {
    return Action(MarketAction.onRefresh, payload: payload);
  }
}
