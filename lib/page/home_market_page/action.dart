import 'package:fish_redux/fish_redux.dart';

enum MarketAction {
  pageIndexChange,
  progress
}

class ProgressAction {
  ProgressAction(this.progressing, this.pageIndex);

  final bool progressing;
  final int pageIndex;
}

class MarketActionCreator {
  static Action pageIndexChange(int index) {
    return Action(MarketAction.pageIndexChange, payload: index);
  }

  static Action progress(bool progressing, int pageIndex) {
    return Action(MarketAction.progress, payload: ProgressAction(progressing, pageIndex));
  }
}
