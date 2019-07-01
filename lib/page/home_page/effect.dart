import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<HomeState> ctx) {
}

void _dispose(Action action, Context<HomeState> ctx) {
}