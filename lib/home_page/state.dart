import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/home_discover_page/state.dart';
import 'package:test_app/home_market_page/state.dart';
import 'package:test_app/home_trade_page/state.dart';
import 'package:test_app/home_user_page/state.dart';

class HomeState implements Cloneable<HomeState> {

  final List<Widget> tabs = [
    Tab(text: "行情", icon: Icon(Icons.data_usage)),
    Tab(text: "发现", icon: Icon(Icons.find_in_page)),
    Tab(text: "交易", icon: Icon(Icons.business)),
    Tab(text: "我的", icon: Icon(Icons.supervised_user_circle)),
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
