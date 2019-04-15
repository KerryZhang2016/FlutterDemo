import 'package:fish_redux/fish_redux.dart';

class TradeState implements Cloneable<TradeState> {

  @override
  TradeState clone() {
    return TradeState();
  }
}

TradeState initState(Map<String, dynamic> args) {
  return TradeState();
}
