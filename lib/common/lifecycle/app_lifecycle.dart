import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

enum AppLifecycle { state }

class _WidgetsBindingObserver extends WidgetsBindingObserver {
  final Dispatch dispatch;

  _WidgetsBindingObserver(this.dispatch);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    dispatch(Action(AppLifecycle.state, payload: state));
  }
}

/// use it in effect Lifecycle.initState
/// and effect should watch AppLifecycle.state: _onAppLifecycle
void subscribleAppStateChange<T>(Context<T> ctx) {
  final WidgetsBindingObserver wbo = _WidgetsBindingObserver(ctx.dispatch);
  WidgetsBinding.instance.addObserver(wbo);
  ctx.registerOnDisposed(() => WidgetsBinding.instance.removeObserver(wbo));
}

