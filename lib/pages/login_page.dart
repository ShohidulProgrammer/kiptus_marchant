import 'package:flutter/material.dart';
import 'package:kiptus_marchant/widgets/login_form.dart';
import 'package:kiptus_marchant/widgets/logo_login_screen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned.fill(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[MyLogo(), LoginForm()],
          ),
        ),
      )
    ]));
  }
}
