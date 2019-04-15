import 'package:fish_redux/fish_redux.dart';

class MarketState implements Cloneable<MarketState> {

  @override
  MarketState clone() {
    return MarketState();
  }
}

MarketState initState(Map<String, dynamic> args) {
  return MarketState();
}
