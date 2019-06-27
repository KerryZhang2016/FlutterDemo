import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<HomeState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  ctx.state.tabController = TabController(initialIndex: 0, vsync: tickerProvider, length: 4);
  ctx.state.tabController.addListener(() {
    ctx.dispatch(HomeActionCreator.indexChange(ctx.state.tabController.index));
  });
}

void _dispose(Action action, Context<HomeState> ctx) {
  ctx.state.tabController.dispose();
}