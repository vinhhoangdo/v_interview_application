import 'package:flutter/material.dart';
import 'package:interview_application/src/ui/home/home_page.dart';
import 'package:interview_application/src/ui/login/login_page.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => const LoginPage(),
    home: (BuildContext context) => const HomePage(),
  };
}
