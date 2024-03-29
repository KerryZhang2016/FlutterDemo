import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/page/home_market_page/us_market_page/page.dart';
import 'package:test_app/page/home_market_page/watchlist_page/page.dart';
import 'package:test_app/utils/single_ticker.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MarketPage extends Page<MarketState, String> with SingleTickerProviderMixin {
  MarketPage()
      : super(
            initState: (String args) {
              initMarketState(args);
            },
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MarketState>(
                slots: <String, Dependent<MarketState>>{
                  'Watchlist': WatchlistConnector() + WatchlistPage(),
                  'USMarket': USMarketConnector() + USMarketPage(),
                }),
            middleware: <Middleware<MarketState>>[
            ],);

}
