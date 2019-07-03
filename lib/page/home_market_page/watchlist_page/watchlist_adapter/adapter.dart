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
  @override
  List<ItemBean> get(WatchlistState state) {
    if (state.items?.isNotEmpty == true) {
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
