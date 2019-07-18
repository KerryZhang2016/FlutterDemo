import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/common/style/color/CustomColor.dart';

/// 添加按下效果的容器
class TapBox extends StatefulWidget {
  TapBox(
      {Key key,
      @required this.child,
      this.onTap,
      this.normalColor = const Color(CustomColor.item_normal_bg_color),
      this.pressedColor = const Color(CustomColor.item_pressed_bg_color)})
      : super(key: key);

  final Color normalColor;
  final Color pressedColor;

  final Widget child;
  final Function onTap;

  @override
  State<StatefulWidget> createState() => _TapBoxState();
}

class _TapBoxState extends State<TapBox> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 250));
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onTap,
        onTapDown: (d) => _animationController.forward(),
        onTapUp: (d) => _prepareToIdle(),
        onTapCancel: () => _prepareToIdle(),
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget child) {
              return Container(
                color: _animationController.value == 0
                    ? widget.normalColor
                    : widget.pressedColor,
                child: widget.child,
              );
            }));
  }

  void _prepareToIdle() {
    AnimationStatusListener listener;
    listener = (AnimationStatus statue) {
      if (statue == AnimationStatus.completed) {
        _animationController.removeStatusListener(listener);
        _toStart();
      }
    };
    _animationController.addStatusListener(listener);
    if (!_animationController.isAnimating) {
      _animationController.removeStatusListener(listener);
      _toStart();
    }
  }

  void _toStart() {
    _animationController.stop();
    _animationController.reverse();
  }
}
