import 'package:fish_redux/fish_redux.dart';
import 'package:test_app/utils/keep_alive.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class USMarketPage extends Page<USMarketState, Map<String, dynamic>> {
  USMarketPage()
      : super(
            initState: initUSMarketState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            wrapper: keepAliveWrapper,
            dependencies: Dependencies<USMarketState>(
                adapter: null,
                slots: <String, Dependent<USMarketState>>{
                }),
            middleware: <Middleware<USMarketState>>[
            ],);

}
