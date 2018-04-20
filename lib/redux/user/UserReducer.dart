import 'package:gameware/models/User.dart';
import 'package:gameware/redux/user/UserActions.dart';
import 'package:gameware/redux/user/UserState.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<UserState>([
  new TypedReducer<UserState, UserLoginAction>(_settingLoggedUser),
  new TypedReducer<UserState, SettingUserAction>(_settingUser),
  new TypedReducer<UserState, ErrorSettingUserAction>(_errorSettingUser),
  new TypedReducer<UserState, UserLogoutAction>(_unsettingUser),
]);

UserState _settingLoggedUser(UserState state, UserLoginAction action) {
  return state.copyWith(user: action.user);
}

UserState _settingUser(UserState state, SettingUserAction action) {
  return state.copyWith(user: action.user);
}

UserState _errorSettingUser(UserState state, ErrorSettingUserAction action) {
  return state.copyWith(user: new User());
}

UserState _unsettingUser(UserState state, UserLogoutAction action) {
  return state.copyWith(user: null);
}