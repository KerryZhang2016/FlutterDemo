import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/model/Watchlist.dart';

enum WatchlistAction {
  onRefresh,// 下拉刷新
  onRefreshWatchlist,// 刷新自选
  refreshWatchlist,// 更新自选数据
  updateSort,// 更新排序状态
}

class WatchlistActionCreator {
  static Action onRefresh(dynamic payload) {
    return Action(WatchlistAction.onRefresh, payload: payload);
  }

  static Action onRefreshWatchlist() {
    return Action(WatchlistAction.onRefreshWatchlist);
  }

  static Action refreshWatchlist(List<WatchlistItem> items) {
    return Action(WatchlistAction.refreshWatchlist, payload: items);
  }

  static Action updateSort(int sortIndex) {
    return Action(WatchlistAction.updateSort, payload: sortIndex);
  }
}
