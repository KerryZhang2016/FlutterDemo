import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/utils/log_util.dart';
import 'action.dart';
import 'state.dart';

Effect<WatchlistItemState> buildEffect() {
  return combineEffects(<Object, Effect<WatchlistItemState>>{
    Lifecycle.initState: _initState,
    Lifecycle.appear: _appear,
    Lifecycle.disappear: _disappear,
  });
}

void _initState(Action action, Context<WatchlistItemState> ctx) {
  LogUtil.loggerLevelD("WatchlistItemState ${ctx.state.watchlistItem.nameCN} _initState");
}

void _disappear(Action action, Context<WatchlistItemState> ctx) {
  LogUtil.loggerLevelD("WatchlistItemState ${ctx.state.watchlistItem.nameCN} _disappear");
}

void _appear(Action action, Context<WatchlistItemState> ctx) {
  LogUtil.loggerLevelD("WatchlistItemState ${ctx.state.watchlistItem.nameCN} _appear");
}
