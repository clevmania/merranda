import 'package:flutter/widgets.dart';
import 'package:merrand/ui/login/login.dart';
import 'package:merrand/ui/login/success.dart';
import 'package:merrand/ui/onboard/onboard.dart';
import 'package:merrand/ui/password/forgot_password.dart';
import 'package:merrand/ui/profile_set_up/profile.dart';
import 'package:merrand/ui/register/register.dart';

final Map<String, WidgetBuilder> routes = {
  Onboard.routeName: (context) => Onboard(),
  Login.routeName: (context) => Login(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  LoginSuccess.routeName: (context) => LoginSuccess(),
  Register.routeName: (context) => Register(),
  Profile.routeName : (context) => Profile()
};