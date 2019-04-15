import 'package:flutter/material.dart';

/// 首页底部栏Tab
class HomeTabWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final String icon;

  HomeTabWidget({@required this.text, @required this.textColor, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage(icon),
          width: 20.0,
          height: 20.0,
        ),
        Container(
          margin: EdgeInsets.only(top: 3.0),
          child: Text(text, style: TextStyle(
            color: textColor,
            fontSize: 11.0
          )),
        )
      ],
    );
  }
}
