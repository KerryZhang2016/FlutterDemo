import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/common/style/color/CustomColor.dart';
import 'package:test_app/common/style/image/CustomImage.dart';

class CircleProgress extends StatelessWidget {
  CircleProgress({
    Key key,
    this.progressing,
    this.handleTap,
  }) : super(key: key);

  final bool progressing;
  final Function handleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (!progressing) { handleTap() }
      },
      child: Container(
          padding: EdgeInsets.all(10.0),
          child: progressing
              ? SizedBox(
                  child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          const Color(CustomColor.secondary_text_color)),
                      strokeWidth: 1.5),
                  width: 13,
                  height: 13)
              : Image(
                  image: const AssetImage(CustomImage.market_refresh),
                  width: 17,
                  height: 18)),
    );
  }
}
