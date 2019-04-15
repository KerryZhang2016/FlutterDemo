import 'package:flutter/material.dart';

import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/home_page/page.dart';

Widget createApp() {
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        "home": HomePage()
      },
    ),
  ]);

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