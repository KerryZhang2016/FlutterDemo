import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/utils/keep_alive.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'watchlist_adapter/adapter.dart';

class WatchlistPage extends Page<WatchlistState, Map<String, dynamic>> {
  WatchlistPage()
      : super(
            initState: initWatchlistState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            wrapper: keepAliveWrapper,
            dependencies: Dependencies<WatchlistState>(
                adapter: WatchlistListAdapter(),
                slots: <String, Dependent<WatchlistState>>{
                }),
            middleware: <Middleware<WatchlistState>>[
            ],);

}
