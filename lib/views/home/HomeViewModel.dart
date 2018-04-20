import 'package:gameware/models/User.dart';
import 'package:gameware/redux/app/AppState.dart';
import 'package:gameware/redux/user/UserActions.dart';
import 'package:gameware/redux/user/UserSelectors.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class HomeViewModel {
  HomeViewModel({
    @required this.user,
    @required this.logout,
  });

  final User user;
  final Function logout;

  static HomeViewModel fromStore(Store<AppState> store) {
    return new HomeViewModel(
      user: userSelector(store.state),
      logout: () => store.dispatch(new UserLogoutAction()),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HomeViewModel &&
              runtimeType == other.runtimeType &&
              user == other.user &&
              logout == other.logout;

  @override
  int get hashCode =>
      user.hashCode ^
      logout.hashCode;
}
