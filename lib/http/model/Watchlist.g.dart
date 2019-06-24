// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Watchlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchlistResponse _$WatchlistResponseFromJson(Map<String, dynamic> json) {
  return WatchlistResponse(
      json['ret'] as int,
      json['market'] as String,
      json['serverTime'] as int,
      json['group'] as String,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : WatchlistItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$WatchlistResponseToJson(WatchlistResponse instance) =>
    <String, dynamic>{
      'ret': instance.ret,
      'market': instance.market,
      'serverTime': instance.serverTime,
      'group': instance.group,
      'items': instance.items
    };

WatchlistItem _$WatchlistItemFromJson(Map<String, dynamic> json) {
  return WatchlistItem(
      json['symbol'] as String,
      json['nameCN'] as String,
      (json['latestPrice'] as num)?.toDouble(),
      (json['preClose'] as num)?.toDouble(),
      (json['halted'] as num)?.toDouble(),
      json['market'] as String,
      json['secType'] as String,
      json['delay'] as int,
      json['auction'] as int,
      json['timestamp'] as int,
      json['hourTrading'] == null
          ? null
          : HourTrading.fromJson(json['hourTrading'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WatchlistItemToJson(WatchlistItem instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'nameCN': instance.nameCN,
      'latestPrice': instance.latestPrice,
      'preClose': instance.preClose,
      'halted': instance.halted,
      'market': instance.market,
      'secType': instance.secType,
      'delay': instance.delay,
      'auction': instance.auction,
      'timestamp': instance.timestamp,
      'hourTrading': instance.hourTrading
    };

HourTrading _$HourTradingFromJson(Map<String, dynamic> json) {
  return HourTrading(
      json['tag'] as String,
      (json['latestPrice'] as num)?.toDouble(),
      (json['preClose'] as num)?.toDouble(),
      json['latestTime'] as String,
      json['volume'] as int,
      json['timestamp'] as int);
}

Map<String, dynamic> _$HourTradingToJson(HourTrading instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'latestPrice': instance.latestPrice,
      'preClose': instance.preClose,
      'latestTime': instance.latestTime,
      'volume': instance.volume,
      'timestamp': instance.timestamp
    };
