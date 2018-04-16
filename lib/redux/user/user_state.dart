import 'package:gameware/models/User.dart';
import 'package:meta/meta.dart';

@immutable
class UserState {
  UserState({
    @required this.user
  });

  final User user;

  factory UserState.initial() {
    return new UserState(
      user: new User('', ''),
    );
  }

  UserState copyWith({
    User user
  }) {
    return new UserState(
      user: user ?? this.user
    );
  }

  @override
  bool operator == (Object other) =>
    identical(this, other) || other is UserState &&
      user == other.user;

  @override
  int get hashCode =>
    user.hashCode;
}