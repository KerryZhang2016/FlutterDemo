import 'package:fish_redux/fish_redux.dart';

import 'package:test_app/page/home_page/bottom_navigation_component/reducer.dart';
import 'package:test_app/page/home_page/bottom_navigation_component/state.dart';
import 'package:test_app/page/home_page/bottom_navigation_component/view.dart';

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
