import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/common/style/color/CustomColor.dart';

class TapBox extends StatefulWidget {
  TapBox(
      {Key key,
      @required this.child,
      this.normalColor = const Color(CustomColor.item_normal_bg_color),
      this.pressedColor = const Color(CustomColor.item_pressed_bg_color)})
      : super(key: key);

  final Color normalColor;
  final Color pressedColor;

  final Widget child;

  @override
  State<StatefulWidget> createState() => _TapBoxState();
}

class _TapBoxState extends State<TapBox> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(

      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: widget.child,
        color: _highlight ? widget.pressedColor : widget.normalColor,
      ),
    );
  }
}
