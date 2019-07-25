import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class StockDetailPage extends Page<StockDetailState, Map<String, dynamic>> {
  StockDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<StockDetailState>(
                adapter: null,
                slots: <String, Dependent<StockDetailState>>{
                }),
            middleware: <Middleware<StockDetailState>>[
            ],);

}
