import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/model/Watchlist.dart';

class WatchlistItemState implements Cloneable<WatchlistItemState> {

  WatchlistItem watchlistItem;

  WatchlistItemState({this.watchlistItem});

  @override
  WatchlistItemState clone() {
    return WatchlistItemState()
      ..watchlistItem = watchlistItem;
  }
}