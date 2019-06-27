
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

import 'app_lifecycle.dart';

class _AppLifecycleState<T> extends ComponentState<T> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // todo 处理下mainCtx的问题
//    mainCtx.dispatch(Action(AppLifecycle.state, payload: state));
  }
}

/// use it in component like: with AppLifecycleMixin<T>
mixin AppLifecycleMixin<T> on Component<T> {
  @override
  ComponentState<T> createState() => _AppLifecycleState<T>();
}