import 'package:flutter/widgets.dart';
import 'package:merrand/ui/login/login.dart';
import 'package:merrand/ui/onboard/onboard.dart';

final Map<String, WidgetBuilder> routes = {
  Onboard.routeName: (context) => Onboard(),
  Login.routeName: (context) => Login(),
};