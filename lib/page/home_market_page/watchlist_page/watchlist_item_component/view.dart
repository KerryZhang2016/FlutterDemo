import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/dimen/CustomDimen.dart';
import 'package:test_app/common/style/image/CustomImage.dart';
import 'package:test_app/http/model/Watchlist.dart';
import 'package:test_app/widget/TapBox.dart';

import 'state.dart';

Widget buildView(
    WatchlistItemState state, Dispatch dispatch, ViewService viewService) {
  return TapBox(child: _buildMarketListItem(state.watchlistItem, dispatch));
}

Widget _buildMarketListItem(WatchlistItem item, Dispatch dispatch) {
  return Container(
    height: 58.0,
    child: Row(
      children: <Widget>[
        Container(
          width: 15,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 2),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 15,
                child: Image(
                  image: AssetImage(CustomImage.region_us),
                  width: 13.0,
                  height: 10.0,
                ),
              ),
              Positioned(
                top: 35,
                child: Image(
                  image: AssetImage(item.getHourTradingIcon()),
                  width: 13.0,
                  height: 10.0,
                ),
              ),
            ],
          )
        ),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 4),
            width: 150,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 11,
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      item.symbol,
                      maxLines: 1,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(CustomColor.main_text_color),
                          fontSize: CustomDimen.text_size_medium,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ),
                Positioned(
                  top: 33,
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      item.nameCN,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,// 溢出显示...
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(CustomColor.secondary_text_color),
                          fontSize: CustomDimen.text_size_micro),
                    ),
                  )
                )
              ],
            )),
        Expanded(
          child: Stack(
            children: <Widget>[
              Positioned(
                  right: 14,
                  top: 8,
                  child: Text(
                    item.getChgText(),
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: item.getChgColor(),
                        fontSize: CustomDimen.text_size_large_16,
                        fontWeight: FontWeight.w600),
                  )),
              Positioned(
                  right: 14,
                  top: 33,
                  child: Text(
                    item.getHourTradingChangeRatioText(),
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(CustomColor.secondary_text_color),
                        fontSize: CustomDimen.text_size_micro),
                  )),
              Positioned(
                  right: 123,
                  top: 8,
                  child: Text(
                    item.latestPrice.toString(),
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(CustomColor.main_text_color),
                        fontSize: CustomDimen.text_size_large_16,
                        fontWeight: FontWeight.w600),
                  )),
              Positioned(
                  right: 123,
                  top: 33,
                  child: Text(
                    item.getHourTradingPriceText(),
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(CustomColor.secondary_text_color),
                        fontSize: CustomDimen.text_size_micro),
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}
