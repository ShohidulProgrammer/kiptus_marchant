import 'package:flutter/material.dart';

Widget myAppBar() {
  return AppBar(
      backgroundColor: Color(0xff95e2f9),
      title: Image.asset('assets/kiptus.png'),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset('assets/profile.png'),
            ))
      ]);
}
