import 'package:flutter/material.dart';
import 'package:kiptus_marchant/model/user_model.dart';
import 'package:kiptus_marchant/pages/login_page.dart';
import 'package:kiptus_marchant/pages/otp_input_page.dart';
import 'package:kiptus_marchant/pages/profile_page.dart';
import 'package:kiptus_marchant/pages/sign_up_page.dart';

import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case otpInputPageRoute:
        User user = settings.arguments;
        return MaterialPageRoute(builder: (_) => OTPInputPage(user: user));
      case profilePageRoute:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
