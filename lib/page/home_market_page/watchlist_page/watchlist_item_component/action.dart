import 'package:fish_redux/fish_redux.dart';

enum WatchlistItemAction { action }

class WatchlistItemActionCreator {
  static Action onAction() {
    return const Action(WatchlistItemAction.action);
  }
}
