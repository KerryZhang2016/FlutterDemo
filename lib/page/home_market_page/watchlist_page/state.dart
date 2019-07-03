import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/model/Watchlist.dart';

class WatchlistState implements Cloneable<WatchlistState> {

  List<WatchlistItem> items;

  @override
  WatchlistState clone() {
    return WatchlistState()
      ..items = items;
  }
}

WatchlistState initWatchlistState(Map<String, dynamic> args) {
  return WatchlistState()
    ..items = [];
}
