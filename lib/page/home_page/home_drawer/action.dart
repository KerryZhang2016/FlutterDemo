import 'package:fish_redux/fish_redux.dart';

enum HomeDrawerAction {
  onUpdateGroupState,// 获取分组状态
  updateGroupState,// 更新分组状态
}

class HomeDrawerActionCreator {
  static Action onUpdateGroupState() {
    return const Action(HomeDrawerAction.onUpdateGroupState);
  }

  static Action updateGroupState(int count) {
    return Action(HomeDrawerAction.updateGroupState, payload: count);
  }
}
