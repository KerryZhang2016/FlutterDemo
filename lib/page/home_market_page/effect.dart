import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/lifecycle/app_lifecycle.dart';
import 'package:test_app/utils/log_util.dart';
import 'action.dart';
import 'state.dart';

Effect<MarketState> buildEffect() {
  return combineEffects(<Object, Effect<MarketState>>{
    Lifecycle.initState: _initState,
    Lifecycle.didChangeDependencies: _didChangeDependencies,
    Lifecycle.build: _build,
    Lifecycle.reassemble: _reassemble,
    Lifecycle.didUpdateWidget: _didUpdateWidget,
    Lifecycle.deactivate: _deactivate,
    Lifecycle.dispose: _dispose,

    AppLifecycle.state: _onAppLifecycle,
  });
}

void _initState(Action action, Context<MarketState> ctx) async {
  LogUtil.loggerLevelI("Market Page _initState");
  subscribleAppStateChange(ctx);

  final Object tickerProvider = ctx.stfState;
  TabController tabController = TabController(length: 2, vsync: tickerProvider);
  tabController.addListener(() {
    if(tabController.indexIsChanging) {
      ctx.state.pageController.animateToPage(tabController.index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      ctx.dispatch(MarketActionCreator.pageIndexChange(tabController.index));
    }
  });
  ctx.state.tabController = tabController;
}

void _didChangeDependencies(Action action, Context<MarketState> ctx) {
  LogUtil.loggerLevelI("Market Page _didChangeDependencies");
}

void _build(Action action, Context<MarketState> ctx) {
  LogUtil.loggerLevelI("Market Page _build");
}

void _reassemble(Action action, Context<MarketState> ctx) {
  LogUtil.loggerLevelI("Market Page _reassemble");
}

void _didUpdateWidget(Action action, Context<MarketState> ctx) {
  LogUtil.loggerLevelI("Market Page _didUpdateWidget");
}

void _deactivate(Action action, Context<MarketState> ctx) {
  LogUtil.loggerLevelI("Market Page _deactivate");
}

void _dispose(Action action, Context<MarketState> ctx) {
  LogUtil.loggerLevelI("Market Page _dispose");
}

void _onAppLifecycle(Action action, Context<Object> ctx) {
  LogUtil.loggerLevelW("Market Page _onAppLifecycle ${action.payload}");
}
