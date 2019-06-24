import 'package:flutter/material.dart';
import 'dart:math' as math;

/// 自定义自带状态栏padding的widget
class TopAreaWidget extends StatelessWidget {
  final Widget child;

  TopAreaWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double top = math.max(padding.top, EdgeInsets.zero.top); //计算状态栏的高度

    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: top,
        ),
        Expanded(child: child),
      ],
    );
  }
}
