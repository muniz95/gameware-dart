import 'package:gameware/models/User.dart';
import 'package:gameware/redux/user/user_actions.dart';
import 'package:gameware/redux/user/user_state.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<UserState>([
  new TypedReducer<UserState, SettingUserAction>(_settingUser),
  new TypedReducer<UserState, ErrorSettingUserAction>(_errorSettingUser),
]);

UserState _settingUser(UserState state, SettingUserAction action) {
  return state.copyWith(user: action.user);
}

UserState _errorSettingUser(UserState state, ErrorSettingUserAction action) {
  return state.copyWith(user: new User('', ''));
}