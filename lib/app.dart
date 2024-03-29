import 'package:flutter/material.dart';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:test_app/page/home_page/page.dart';
import 'package:test_app/http/http.dart';
import 'package:test_app/page/market/market_stock_detail/page.dart';

Widget createApp() {
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        "home": HomePage(),
        "stockDetail": StockDetailPage(),
      },
    ),
  ]);

  // set status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
  ));
  // init dio
  initDio();

  return MaterialApp(
    title: "Test",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: routes.buildPage("home", null),
    onGenerateRoute: (RouteSettings settings) =>
        MaterialPageRoute<Object>(builder: (BuildContext context) =>
            routes.buildPage(settings.name, settings.arguments)
        )
  );
}