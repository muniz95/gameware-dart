import 'package:flutter/material.dart';
import 'package:gameware/screens/login_screen.dart';
import 'package:gameware/screens/main_screen.dart';

final routes = {
  '/login': (BuildContext ctx) => new LoginScreen(),
  '/home': (BuildContext ctx) => new MainScreen(),
};