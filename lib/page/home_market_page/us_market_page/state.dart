import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/utils/log_util.dart';

class USMarketState implements Cloneable<USMarketState> {

  @override
  USMarketState clone() {
    return USMarketState();
  }
}

USMarketState initUSMarketState(Map<String, dynamic> args) {
  LogUtil.loggerLevelD("USMarketPage initUSMarketState");
  return USMarketState();
}
