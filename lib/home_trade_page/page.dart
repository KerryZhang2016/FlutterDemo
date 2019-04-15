import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TradePage extends Page<TradeState, Map<String, dynamic>> {
  TradePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TradeState>(
                adapter: null,
                slots: <String, Dependent<TradeState>>{
                }),
            middleware: <Middleware<TradeState>>[
            ],);

}
