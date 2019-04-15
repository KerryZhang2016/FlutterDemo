import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/page/home_discover_page/page.dart';
import 'package:test_app/page/home_market_page/page.dart';
import 'package:test_app/page/home_trade_page/page.dart';
import 'package:test_app/page/home_user_page/page.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                  'market': MarketConnector() + MarketPage(),
                  'discover': DiscoverConnector() + DiscoverPage(),
                  'trade': TradeConnector() + TradePage(),
                  'user': UserConnector() + UserPage(),
                }),
            middleware: <Middleware<HomeState>>[
              logMiddleware(tag: 'HomePage'),
            ],);

  @override
  ComponentState<HomeState> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ComponentState<HomeState> with SingleTickerProviderStateMixin {}

