import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/model/Watchlist.dart';

enum WatchlistAction {
  onRefresh,// 下拉刷新
  onRefreshWatchlist,// 刷新自选
  refreshWatchlist// 更新自选数据
}

class WatchlistActionCreator {
  static Action onRefresh(dynamic payload) {
    return Action(WatchlistAction.onRefresh, payload: payload);
  }

  static Action onRefreshWatchlist() {
    return Action(WatchlistAction.onRefreshWatchlist);
  }

  static Action refreshWatchlist(List<WatchlistItem> payload) {
    return Action(WatchlistAction.refreshWatchlist, payload: payload);
  }
}
