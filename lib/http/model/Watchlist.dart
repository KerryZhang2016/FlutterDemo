import 'package:json_annotation/json_annotation.dart';

part 'Watchlist.g.dart';

@JsonSerializable()
class WatchlistResponse {
  int ret;
  String market;
  int serverTime;
  String group;
  List<WatchlistItem> items;

  WatchlistResponse(
      this.ret, this.market, this.serverTime, this.group, this.items);

  @override
  String toString() {
    return 'WatchlistResponse{ret: $ret, market: $market, serverTime: $serverTime, group: $group, items: $items}';
  }

  factory WatchlistResponse.fromJson(Map<String, dynamic> json) =>
      _$WatchlistResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WatchlistResponseToJson(this);
}

@JsonSerializable()
class WatchlistItem {
  String symbol;
  String nameCN;
  double latestPrice;
  double preClose;
  double halted;
  String market;
  String secType;
  int delay;
  int auction;
  int timestamp;
  HourTrading hourTrading;

  WatchlistItem(
      this.symbol,
      this.nameCN,
      this.latestPrice,
      this.preClose,
      this.halted,
      this.market,
      this.secType,
      this.delay,
      this.auction,
      this.timestamp,
      this.hourTrading);

  @override
  String toString() {
    return 'WatchlistItem{symbol: $symbol, nameCN: $nameCN, latestPrice: $latestPrice, preClose: $preClose, halted: $halted, market: $market, secType: $secType, delay: $delay, auction: $auction, timestamp: $timestamp, hourTrading: $hourTrading}';
  }

  factory WatchlistItem.fromJson(Map<String, dynamic> json) =>
      _$WatchlistItemFromJson(json);

  Map<String, dynamic> toJson() => _$WatchlistItemToJson(this);
}

@JsonSerializable()
class HourTrading {
  String tag;
  double latestPrice;
  double preClose;
  String latestTime;
  int volume;
  int timestamp;

  HourTrading(this.tag, this.latestPrice, this.preClose, this.latestTime,
      this.volume, this.timestamp);

  @override
  String toString() {
    return 'HourTrading{tag: $tag, latestPrice: $latestPrice, preClose: $preClose, latestTime: $latestTime, volume: $volume, timestamp: $timestamp}';
  }

  factory HourTrading.fromJson(Map<String, dynamic> json) =>
      _$HourTradingFromJson(json);

  Map<String, dynamic> toJson() => _$HourTradingToJson(this);
}
