import 'package:flutter/material.dart';

import 'package:gameware/views/main/MainPage.dart';
import 'package:gameware/views/login/LoginPage.dart';
import 'package:gameware/views/signup/SignupPage.dart';

final routes = {
  '/signup': (BuildContext ctx) => new SignupPage(),
  '/login': (BuildContext ctx) => new LoginPage(),
  '/home': (BuildContext ctx) => new MainPage(),
  '/': (BuildContext ctx) => new LoginPage(),
};