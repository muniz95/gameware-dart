import 'package:gameware/data/RestDatasource.dart';
import 'package:gameware/models/User.dart';

abstract class LoginContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginPresenter {
  LoginContract _view;
  RestDatasource api = new RestDatasource();
  LoginPresenter(this._view);

  doLogin(String username, String password) {
    // api.login(username, password).then((User user) {
    //   _view.onLoginSuccess(user);
    // }).catchError((Exception error) => _view.onLoginError(error.toString()));
    _view.onLoginSuccess(new User('username22', 'username22'));
  }
}