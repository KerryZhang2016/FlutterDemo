import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/http/model/Watchlist.dart';

class WatchlistState implements Cloneable<WatchlistState> {

  List<WatchlistItem> items;
  int sortIndex = 0;// sortIndex 0 - key自然序; 1 - 当前价排序; 2 - 涨跌幅排序
  int sortState = 0;// 无排序（按原始添加顺序排序）；1 - 倒序排序；2 - 顺序排序

  @override
  WatchlistState clone() {
    return WatchlistState()
      ..items = items
      ..sortIndex = sortIndex
      ..sortState = sortState;
  }
}

WatchlistState initWatchlistState(Map<String, dynamic> args) {
  return WatchlistState()
    ..items = []
    ..sortIndex = 0
    ..sortState = 0;
}
