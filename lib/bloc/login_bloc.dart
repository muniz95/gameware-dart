import 'package:gameware/bloc/provider.dart';
import 'package:gameware/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {

  final _loggedUser = BehaviorSubject<User>();
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Function(User) get authenticate => (user) => _loggedUser.sink.add(user);
  Function get setUsername => _username.sink.add;
  Function get setPassword => _password.sink.add;

  Stream<User> get loadStatus => _loggedUser.stream;
  Stream<String> get streamUsername => _username.stream;
  Stream<String> get streamPassword => _password.stream;

  User get loggedUser => _loggedUser.stream.value;
  String get username => _username.stream.value;
  String get password => _password.stream.value;

  @override
  void dispose() {
    _loggedUser.close();
    _username.close();
    _password.close();
  }

}