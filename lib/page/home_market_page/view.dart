import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/dimen/CustomDimen.dart';
import 'package:test_app/common/style/image/CustomImage.dart';

import 'state.dart';

Widget buildView(
    MarketState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          height: 42,
          color: Colors.white,
          child: Center(
            child: Text(
              'Watchlist',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(CustomColor.main_text_color),
                  fontSize: CustomDimen.text_size_tall_23,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return _buildMarketListItem(state, dispatch, index);
                }),
          ),
        )
      ],
    ),
  );
}

Widget _buildMarketListItem(MarketState state, Dispatch dispatch, int index) {
  return Container(
    height: 58.0,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 4, top: 15),
          child: Image(
            image: AssetImage(CustomImage.region_us),
            width: 15.0,
            height: 10.0,
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 5),
            width: 150,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 11,
                  child: Text(
                    state.items[index].symbol,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(CustomColor.main_text_color),
                        fontSize: CustomDimen.text_size_medium,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  top: 33,
                  child: Text(
                    state.items[index].nameCN,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(CustomColor.secondary_text_color),
                        fontSize: CustomDimen.text_size_micro),
                  ),
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
                    state.items[index].getChgText(),
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: state.items[index].getChgColor(),
                        fontSize: CustomDimen.text_size_large_16,
                        fontWeight: FontWeight.w500),
                  )),
              Positioned(
                  right: 14,
                  top: 33,
                  child: Text(
                    "",
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(CustomColor.main_text_color),
                        fontSize: CustomDimen.text_size_micro),
                  )),
              Positioned(
                  right: 123,
                  top: 8,
                  child: Text(
                    state.items[index].latestPrice.toString(),
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(CustomColor.main_text_color),
                        fontSize: CustomDimen.text_size_large_16,
                        fontWeight: FontWeight.w500),
                  )),
              Positioned(
                  right: 123,
                  top: 33,
                  child: Text(
                    "",
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(CustomColor.main_text_color),
                        fontSize: CustomDimen.text_size_micro),
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}
