import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CustomBottomNavigationBarComponent extends Component<CustomBottomNavigationBarState> {
  CustomBottomNavigationBarComponent()
      : super(
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CustomBottomNavigationBarState>(
                adapter: null,
                slots: <String, Dependent<CustomBottomNavigationBarState>>{
                }),);

}
