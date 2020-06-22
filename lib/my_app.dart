import 'package:flutter/material.dart';

import 'router/constants.dart';
import 'router/router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiptus Marchant',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff95e2f9),
        buttonColor: Color(0xff069be5),
        primaryColor: Color(0xffe6e7e8),
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
