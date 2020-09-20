import 'package:flutter/widgets.dart';
import 'package:merrand/ui/login/login.dart';
import 'package:merrand/ui/onboard/onboard.dart';
import 'package:merrand/ui/password/forgot_password.dart';

final Map<String, WidgetBuilder> routes = {
  Onboard.routeName: (context) => Onboard(),
  Login.routeName: (context) => Login(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
};