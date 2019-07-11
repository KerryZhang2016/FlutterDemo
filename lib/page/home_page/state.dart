import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/common/style/image/CustomImage.dart';
import 'package:test_app/common/style/text/CustomText.dart';
import 'package:test_app/page/home_discover_page/state.dart';
import 'package:test_app/page/home_market_page/state.dart';
import 'package:test_app/page/home_trade_page/state.dart';
import 'package:test_app/page/home_user_page/state.dart';

import 'package:test_app/page/home_page/bottom_navigation_component/state.dart';

import 'home_drawer/state.dart';

class HomeState implements Cloneable<HomeState> {

  bool drawerEnable = true;
  CustomBottomNavigationBarState customBottomNavigationBarState;
  HomeDrawerState homeDrawerState;

  MarketState marketState;

  @override
  HomeState clone() {
    return HomeState()
      ..drawerEnable = drawerEnable
      ..customBottomNavigationBarState = customBottomNavigationBarState
      ..homeDrawerState = homeDrawerState
      ..marketState = marketState;
  }
}

HomeState initHomeState(Map<String, dynamic> args) {
  // bottom navigation bar
  var tabTextList = [
    CustomText.home_markets,
    CustomText.home_discover,
    CustomText.home_trade,
    CustomText.home_me
  ];
  var tabIconList = [
    AssetImage(CustomImage.home_tab_markets),
    AssetImage(CustomImage.home_tab_discover),
    AssetImage(CustomImage.home_tab_trade),
    AssetImage(CustomImage.home_tab_me)
  ];
  var tabIconSelectList = [
    AssetImage(CustomImage.home_tab_markets_select),
    AssetImage(CustomImage.home_tab_discover_select),
    AssetImage(CustomImage.home_tab_trade_select),
    AssetImage(CustomImage.home_tab_me_select)
  ];

  return HomeState()
    ..drawerEnable = true
    ..customBottomNavigationBarState = initCustomBottomNavigationBarState(
        tabTextList, tabIconList, tabIconSelectList)
    ..homeDrawerState = initHomeDrawerState(null)
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

class HomeDrawerConnector extends ConnOp<HomeState, HomeDrawerState> {
  @override
  HomeDrawerState get(HomeState state) {
    return state.homeDrawerState;
  }

  @override
  void set(HomeState state, HomeDrawerState subState) {
    state.homeDrawerState = subState;
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
