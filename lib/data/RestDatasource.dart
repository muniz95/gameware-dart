import 'dart:async';

import 'package:gameware/models/User.dart';
import 'package:gameware/utils/NetworkUtil.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static const BASE_URL = "http://YOUR_BACKEND_IP/login_app_backend";
  static const LOGIN_URL = BASE_URL + "/login.php";
  static const _API_KEY = "somerandomkey";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}