import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/home_discover_page/state.dart';
import 'package:test_app/home_market_page/state.dart';
import 'package:test_app/home_trade_page/state.dart';
import 'package:test_app/home_user_page/state.dart';
import 'package:test_app/widget/HomeTabWidget.dart';

class HomeState implements Cloneable<HomeState> {

  static Color selectTextColorconst = Color(0xFF212327);
  static Color normalTextColorconst = Color(0xFF88889C);

  final List<Widget> tabs = [
    HomeTabWidget(text: "Markets", textColor: normalTextColorconst, icon: "assets/images/ic_home_tabbar_markets.png"),
    HomeTabWidget(text: "Discover", textColor: normalTextColorconst, icon: "assets/images/ic_home_tabbar_discovery.png"),
    HomeTabWidget(text: "Trade", textColor: normalTextColorconst, icon: "assets/images/ic_home_tabbar_trade.png"),
    HomeTabWidget(text: "Me", textColor: normalTextColorconst, icon: "assets/images/ic_home_tabbar_me.png"),
  ];
  final List<Widget> selectTabs = [
    HomeTabWidget(text: "Markets", textColor: selectTextColorconst, icon: "assets/images/ic_home_tabbar_markets_select.png"),
    HomeTabWidget(text: "Discover", textColor: selectTextColorconst, icon: "assets/images/ic_home_tabbar_discovery_select.png"),
    HomeTabWidget(text: "Trade", textColor: selectTextColorconst, icon: "assets/images/ic_home_tabbar_trade_select.png"),
    HomeTabWidget(text: "Me", textColor: selectTextColorconst, icon: "assets/images/ic_home_tabbar_me_select.png"),
  ];

  int selectedIndex = 0;
  TabController tabController;

  @override
  HomeState clone() {
    return HomeState()
      ..selectedIndex = selectedIndex
      ..tabController = tabController;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..selectedIndex = 0;
}

class MarketConnector extends ConnOp<HomeState, MarketState> {
  @override
  MarketState get(HomeState state) {
    final MarketState marketState = MarketState();
    return marketState;
  }

  @override
  void set(HomeState state, MarketState subState) {}
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
