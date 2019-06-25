import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/image/CustomImage.dart';
import 'package:test_app/common/style/text/CustomText.dart';
import 'package:test_app/page/home_discover_page/state.dart';
import 'package:test_app/page/home_market_page/state.dart';
import 'package:test_app/page/home_trade_page/state.dart';
import 'package:test_app/page/home_user_page/state.dart';
import 'package:test_app/widget/HomeTabWidget.dart';

class HomeState implements Cloneable<HomeState> {

  final List<Widget> tabs = [
    HomeTabWidget(text: CustomText.home_markets, textColor: Color(CustomColor.home_tab_text_color),
        icon: CustomImage.home_tab_markets),
    HomeTabWidget(text: CustomText.home_discover, textColor: Color(CustomColor.home_tab_text_color),
        icon: CustomImage.home_tab_discover),
    HomeTabWidget(text: CustomText.home_trade, textColor: Color(CustomColor.home_tab_text_color),
        icon: CustomImage.home_tab_trade),
    HomeTabWidget(text: CustomText.home_me, textColor: Color(CustomColor.home_tab_text_color),
        icon: CustomImage.home_tab_me),
  ];
  final List<Widget> selectTabs = [
    HomeTabWidget(text: CustomText.home_markets, textColor: Color(CustomColor.home_tab_select_text_color),
        icon: CustomImage.home_tab_markets_select),
    HomeTabWidget(text: CustomText.home_discover, textColor: Color(CustomColor.home_tab_select_text_color),
        icon: CustomImage.home_tab_discover_select),
    HomeTabWidget(text: CustomText.home_trade, textColor: Color(CustomColor.home_tab_select_text_color),
        icon: CustomImage.home_tab_trade_select),
    HomeTabWidget(text: CustomText.home_me, textColor: Color(CustomColor.home_tab_select_text_color),
        icon: CustomImage.home_tab_me_select),
  ];

  int selectedIndex = 0;
  TabController tabController;

  MarketState marketState;

  @override
  HomeState clone() {
    return HomeState()
      ..selectedIndex = selectedIndex
      ..tabController = tabController;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..selectedIndex = 0
    ..marketState = initMarketState(null);
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
