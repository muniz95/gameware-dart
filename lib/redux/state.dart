import 'package:gameware/models/User.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final User user;

  AppState({
    this.user,
  });

  AppState copyWith({int user}) => new AppState(user: user ?? this.user);
}