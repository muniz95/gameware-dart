import 'package:gameware/models/User.dart';

class InitAction {}

class InitCompleteAction {
  InitCompleteAction(
    this.selectedUser,
  );

  final User selectedUser;
}

class ChangeCurrentUserAction {
  ChangeCurrentUserAction(this.selectedUser);
  final User selectedUser;
}
