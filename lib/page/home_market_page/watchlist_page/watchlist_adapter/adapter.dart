import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/model/Watchlist.dart';
import 'package:test_app/page/home_market_page/watchlist_page/watchlist_item_component/component.dart';
import 'package:test_app/page/home_market_page/watchlist_page/watchlist_item_component/state.dart';

import '../state.dart';
import 'reducer.dart';

class WatchlistListAdapter extends DynamicFlowAdapter<WatchlistState> {
  WatchlistListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "watchlistItem": WatchlistItemComponent(),
          },
          connector: _WatchlistListConnector(),
          reducer: buildReducer(),
        );
}

class _WatchlistListConnector extends ConnOp<WatchlistState, List<ItemBean>> {
  int watchlistItemComparator(
      WatchlistItem a, WatchlistItem b, int sortIndex, int sortState) {
    int defaultComparator(WatchlistItem a, WatchlistItem b) {
      if (a.index > b.index) {
        return 1;
      } else if (a.index < b.index) {
        return -1;
      } else {
        return 0;
      }
    }

    if (sortIndex == 0 || sortState == 0) {
      // 默认排序
      return defaultComparator(a, b);
    } else if (sortIndex == 1) {
      // 价格排序
      var t = sortState == 1 ? 1 : -1;
      if (a.latestPrice > b.latestPrice) {
        return 1 * t;
      } else if (a.latestPrice < b.latestPrice) {
        return -1 * t;
      } else {
        return defaultComparator(a, b);
      }
    } else if (sortIndex == 2) {
      // 涨跌幅排序
      var t = sortState == 1 ? 1 : -1;
      if (a.getChg() > b.getChg()) {
        return 1 * t;
      } else if (a.getChg() < b.getChg()) {
        return -1 * t;
      } else {
        return defaultComparator(a, b);
      }
    } else {
      return defaultComparator(a, b);
    }
  }

  @override
  List<ItemBean> get(WatchlistState state) {
    if (state.items?.isNotEmpty == true) {
      state.items.sort((WatchlistItem a, WatchlistItem b) =>
          watchlistItemComparator(a, b, state.sortIndex, state.sortState));
      return state.items
          .map<ItemBean>((WatchlistItem data) => ItemBean(
              'watchlistItem', WatchlistItemState(watchlistItem: data)))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(WatchlistState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.items = List<WatchlistItem>.from(items
          .map<WatchlistItem>((ItemBean bean) =>
              (bean.data as WatchlistItemState).watchlistItem)
          .toList());
    } else {
      state.items = <WatchlistItem>[];
    }
  }
}
