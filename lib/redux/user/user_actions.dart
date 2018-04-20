import 'package:gameware/models/User.dart';

class UserLoginAction {
  UserLoginAction(this.user);

  final User user;
}

class UserLogoutAction {}

class SettingUserAction {
  SettingUserAction(this.user);

  final User user;
}

class ErrorSettingUserAction {}