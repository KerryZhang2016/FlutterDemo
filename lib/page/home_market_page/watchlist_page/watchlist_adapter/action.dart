import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WatchlistListAdapterAction { action }

class WatchlistListAdapterActionCreator {
  static Action onAction() {
    return const Action(WatchlistListAdapterAction.action);
  }
}
