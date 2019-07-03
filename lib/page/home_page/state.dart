import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/common/style/image/CustomImage.dart';
import 'package:test_app/common/style/text/CustomText.dart';
import 'package:test_app/page/home_discover_page/state.dart';
import 'package:test_app/page/home_market_page/state.dart';
import 'package:test_app/page/home_trade_page/state.dart';
import 'package:test_app/page/home_user_page/state.dart';

import 'package:test_app/page/home_page/bottom_navigation_component/state.dart';

class HomeState implements Cloneable<HomeState> {
  CustomBottomNavigationBarState customBottomNavigationBarState;

  MarketState marketState;

  @override
  HomeState clone() {
    return HomeState()
      ..customBottomNavigationBarState = customBottomNavigationBarState
      ..marketState = marketState;
  }
}

HomeState initState(Map<String, dynamic> args) {
  // bottom navigation bar
  var tabTextList = [
    CustomText.home_markets,
    CustomText.home_discover,
    CustomText.home_trade,
    CustomText.home_me
  ];
  var tabIconList = [
    CustomImage.home_tab_markets,
    CustomImage.home_tab_discover,
    CustomImage.home_tab_trade,
    CustomImage.home_tab_me
  ];
  var tabIconSelectList = [
    CustomImage.home_tab_markets_select,
    CustomImage.home_tab_discover_select,
    CustomImage.home_tab_trade_select,
    CustomImage.home_tab_me_select
  ];

  return HomeState()
    ..customBottomNavigationBarState = initCustomBottomNavigationBarState(
        tabTextList, tabIconList, tabIconSelectList)
    ..marketState = initMarketState(null);
}

class CustomBottomNavigationBarConnector
    extends ConnOp<HomeState, CustomBottomNavigationBarState> {
  @override
  CustomBottomNavigationBarState get(HomeState state) {
    return state.customBottomNavigationBarState;
  }

  @override
  void set(HomeState state, CustomBottomNavigationBarState subState) {
    state.customBottomNavigationBarState = subState;
  }
}

class MarketConnector extends ConnOp<HomeState, MarketState> {
  @override
  MarketState get(HomeState state) {
    return state.marketState;
  }

  @override
  void set(HomeState state, MarketState subState) {
    state.marketState = subState;
  }
}

class DiscoverConnector extends ConnOp<HomeState, DiscoverState> {
  @override
  DiscoverState get(HomeState state) {
    final DiscoverState discoverState = DiscoverState();
    return discoverState;
  }

  @override
  void set(HomeState state, DiscoverState subState) {}
}

class TradeConnector extends ConnOp<HomeState, TradeState> {
  @override
  TradeState get(HomeState state) {
    final TradeState tradeState = TradeState();
    return tradeState;
  }

  @override
  void set(HomeState state, TradeState subState) {}
}

class UserConnector extends ConnOp<HomeState, UserState> {
  @override
  UserState get(HomeState state) {
    final UserState marketState = UserState();
    return marketState;
  }

  @override
  void set(HomeState state, UserState subState) {}
}
