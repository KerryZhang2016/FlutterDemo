import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MarketPage extends Page<MarketState, Map<String, dynamic>> {
  MarketPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MarketState>(
                adapter: null,
                slots: <String, Dependent<MarketState>>{
                }),
            middleware: <Middleware<MarketState>>[
            ],);

}
