import 'package:flutter/material.dart';

import 'package:gameware/views/home/HomePage.dart';
import 'package:gameware/views/login/LoginPage.dart';
import 'package:gameware/views/signup/SignupPage.dart';

final routes = {
  '/signup': (BuildContext ctx) => new SignupPage(),
  '/login': (BuildContext ctx) => new LoginPage(),
  '/home': (BuildContext ctx) => new HomePage(),
  '/': (BuildContext ctx) => new LoginPage(),
};