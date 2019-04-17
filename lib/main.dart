import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameware/bloc/login_bloc.dart';
import 'package:gameware/bloc/provider.dart';
import 'package:gameware/routes.dart';
import 'package:gameware/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _mainColor = {
    50:Color.fromRGBO(178, 180, 178, .1),
    100:Color.fromRGBO(178, 180, 178, .2),
    200:Color.fromRGBO(178, 180, 178, .3),
    300:Color.fromRGBO(178, 180, 178, .4),
    400:Color.fromRGBO(178, 180, 178, .5),
    500:Color.fromRGBO(178, 180, 178, .6),
    600:Color.fromRGBO(178, 180, 178, .7),
    700:Color.fromRGBO(178, 180, 178, .8),
    800:Color.fromRGBO(178, 180, 178, .9),
    900:Color.fromRGBO(178, 180, 178, 1),
  };
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0XFFB2B4B2), //or set color with: Color(0xFF0000FF)
    ));
    return BlocProvider(
      bloc: LoginBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: MaterialColor(0XFFB2B4B2, _mainColor),
        ),
        home: LoginScreen(),
        routes: routes,
        debugShowCheckedModeBanner: false,
      )
    );
  }
}
