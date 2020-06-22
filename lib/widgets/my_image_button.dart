import 'package:flutter/material.dart';

class MyImageButton extends StatelessWidget {
  final String btnAddress;
  final String routeName;

  const MyImageButton({@required this.btnAddress, this.routeName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
        child: Image.asset(
          'assets/$btnAddress',
          width: 42,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
