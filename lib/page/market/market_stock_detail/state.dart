import 'package:fish_redux/fish_redux.dart';

class StockDetailState implements Cloneable<StockDetailState> {

  @override
  StockDetailState clone() {
    return StockDetailState();
  }
}

StockDetailState initState(Map<String, dynamic> args) {
  return StockDetailState();
}
