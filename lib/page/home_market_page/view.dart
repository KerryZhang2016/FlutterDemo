import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/dimen/CustomDimen.dart';
import 'package:test_app/common/style/image/CustomImage.dart';
import 'package:test_app/page/home_market_page/watchlist_page/action.dart';
import 'package:test_app/widget/CircleProgress.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MarketState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Container(
            height: 42,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Text(
                  'Markets',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(CustomColor.main_text_color),
                      fontSize: CustomDimen.text_size_tall_23,
                      fontWeight: FontWeight.w800),
                ),
                Positioned(
                  left: 5.0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Image(
                            image: AssetImage(CustomImage.market_edt_watchlist),
                            width: 17,
                            height: 18)),
                    onTap: () => Scaffold.of(viewService.context).openDrawer(),
                  ),
                ),
                Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Positioned(
                        right: 5.0,
                        child: CircleProgress(
                          progressing: state.progressing,
                          handleTap: () => {
                                dispatch(
                                    WatchlistActionCreator.onRefreshWatchlist())
                              },
                        )),
                    Positioned(
                      right: 38.0,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Navigator.pushNamed(viewService.context, "stockDetail"),
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage(CustomImage.market_search),
                              width: 16.0,
                              height: 18.0,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )),
        TabBar(
          tabs: <Widget>[
            _buildTabItem('Watchlist', state.currentIndex == 0),
            _buildTabItem('United States', state.currentIndex == 1)
          ],
          indicatorColor: Colors.transparent,
          controller: state.tabController,
        ),
        Divider(color: Color(CustomColor.divider_color), height: 1),
        Expanded(
          child: PageView(
            onPageChanged: (index) {
              state.tabController.animateTo(index);
              dispatch(MarketActionCreator.pageIndexChange(index));
            },
            controller: state.pageController,
            children: <Widget>[
              viewService.buildComponent("Watchlist"),
              viewService.buildComponent("USMarket"),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildTabItem(String text, bool isSelect) {
  return Container(
      height: 44,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(text,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(isSelect
                          ? CustomColor.main_text_color
                          : CustomColor.secondary_text_color),
                      fontSize: CustomDimen.text_size_large,
                      fontWeight:
                          isSelect ? FontWeight.w800 : FontWeight.w600))),
          Container(
              padding: EdgeInsets.only(top: 12),
              child: new Container(
                width: 8,
                height: 8,
                decoration: new BoxDecoration(
                  color: isSelect ? Colors.orange : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ))
        ],
      ));
}
