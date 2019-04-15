import 'package:fish_redux/fish_redux.dart';

class UserState implements Cloneable<UserState> {

  @override
  UserState clone() {
    return UserState();
  }
}

UserState initState(Map<String, dynamic> args) {
  return UserState();
}
