import 'package:flutter/material.dart';

import 'package:gameware/views/home/HomePage.dart';
import 'package:gameware/views/login/LoginPage.dart';
import 'package:gameware/views/product/ProductPage.dart';
import 'package:gameware/views/signup/SignupPage.dart';

final routes = {
  '/signup': (BuildContext ctx) => new SignupPage(),
  '/login': (BuildContext ctx) => new LoginPage(),
  '/product': (BuildContext ctx) => new ProductPage(),
  '/home': (BuildContext ctx) => new HomePage(),
  '/': (BuildContext ctx) => new LoginPage(),
};