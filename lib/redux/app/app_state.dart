import 'package:gameware/redux/user/user_state.dart';
import 'package:meta/meta.dart';

class AppState {
  AppState({
    @required this.userState
  });

  final UserState userState;

  factory AppState.initial() {
    return new AppState(
      userState: new UserState.initial(),
    );
  }

  AppState copyWith({
    UserState userState
  }) {
    return new AppState(
      userState: userState
    );
  }

  @override
  bool operator == (Object other) =>
    identical(this, other) || other is AppState &&
      userState == other.userState;

  @override
  int get hashCode =>
    userState.hashCode;
}