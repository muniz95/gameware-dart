import 'package:flutter/material.dart';
import 'package:gameware/views/login/LoginView.dart';
import 'package:gameware/views/home/HomeView.dart';

final routes = {
  '/login': (BuildContext ctx) => new LoginView(),
  '/home': (BuildContext ctx) => new HomeView(),
  '/': (BuildContext ctx) => new LoginView(),
};