import 'package:gameware/models/User.dart';
import 'package:gameware/redux/app/app_state.dart';
import 'package:gameware/redux/user/user_actions.dart';
import 'package:gameware/redux/user/user_selectors.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class HomePresenter {
  HomePresenter({
    @required this.user,
    @required this.logout,
  });

  final User user;
  final Function logout;

  static HomePresenter fromStore(Store<AppState> store) {
    return new HomePresenter(
      user: userSelector(store.state),
      logout: () => store.dispatch(new UserLogoutAction()),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HomePresenter &&
              runtimeType == other.runtimeType &&
              user == other.user &&
              logout == other.logout;

  @override
  int get hashCode =>
      user.hashCode ^
      logout.hashCode;
}
