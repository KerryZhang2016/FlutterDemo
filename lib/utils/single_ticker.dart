import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

class _SingleTickerProviderStfState<T> extends ComponentState<T>
    with SingleTickerProviderStateMixin {}

mixin SingleTickerProviderMixin<T> on Component<T> {
  @override
  _SingleTickerProviderStfState<T> createState() =>
      _SingleTickerProviderStfState<T>();
}