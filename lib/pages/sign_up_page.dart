import 'package:flutter/material.dart';
import 'package:kiptus_marchant/widgets/logo_login_screen.dart';
import 'package:kiptus_marchant/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned.fill(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MyLogo(),
              SignUpForm(),
            ],
          ),
        ),
      )
    ]));
  }
}
