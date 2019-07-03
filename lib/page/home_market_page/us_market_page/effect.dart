import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/utils/log_util.dart';
import 'action.dart';
import 'state.dart';

Effect<USMarketState> buildEffect() {
  return combineEffects(<Object, Effect<USMarketState>>{
    USMarketAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<USMarketState> ctx) {
  LogUtil.loggerLevelD("USMarketState _initState");
}

void _onAction(Action action, Context<USMarketState> ctx) {
}
