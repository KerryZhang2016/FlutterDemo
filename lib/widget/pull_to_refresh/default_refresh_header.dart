import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/widget/pull_to_refresh/pull_to_refresh.dart';
import 'package:test_app/widget/pull_to_refresh/refresh_header_widget.dart';

/// 默认的下拉刷新头部
class DefaultRefreshHeaderWidget extends RefreshHeaderWidget {
  DefaultRefreshHeaderWidget({Key key}) : super(key: key);

  @override
  _DefaultLoadingState createState() {
    return new _DefaultLoadingState();
  }
}

class _DefaultLoadingState extends RefreshState {
  RefreshStatus currentMode = RefreshStatus.reset;

  @override
  void reset() {
    setState(() {
      currentMode = RefreshStatus.reset;
    });
  }

  @override
  void onMoving(double offset, double totalHeight, double maxDragHeight) {
    if (offset > maxDragHeight) {
      if (currentMode != RefreshStatus.releaseToRefresh) {
        setState(() {
          currentMode = RefreshStatus.releaseToRefresh;
        });
      }
    } else {
      if (currentMode != RefreshStatus.pullToRefresh) {
        setState(() {
          currentMode = RefreshStatus.pullToRefresh;
        });
      }
    }
  }

  @override
  void refreshing() {
    setState(() {
      currentMode = RefreshStatus.refreshing;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget textWidget = _buildText();
    Widget iconWidget = _buildIcon();

    List<Widget> children = <Widget>[
      iconWidget,
      new Container(width: 15.0, height: 15.0),
      textWidget
    ];

    return new Container(
      alignment: Alignment.center,
      height: 60.0,
      child: new Center(
        child: new Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  Widget _buildText() {
    switch (currentMode) {
      case RefreshStatus.releaseToRefresh:
        return new Text("Release to refresh");
      case RefreshStatus.refreshing:
        return new Text("Refreshing...");
      default:
        return new Text("Pull down to refresh");
    }
  }

  Widget _buildIcon() {
    switch (currentMode) {
      case RefreshStatus.releaseToRefresh:
        return Icon(Icons.arrow_upward, color: Colors.grey);
      case RefreshStatus.refreshing:
        return new CircularProgressIndicator(strokeWidth: 2.0);
      default:
        return Icon(Icons.arrow_downward, color: Colors.grey);
    }
  }
}

