import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<HomeState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  ctx.state.tabController = TabController(initialIndex: 0, vsync: tickerProvider, length: 4);

  final controller = ctx.state.tabController;
  controller.addListener(() {
    ctx.dispatch(HomeActionCreator.indexChange(controller.index));
  });
}