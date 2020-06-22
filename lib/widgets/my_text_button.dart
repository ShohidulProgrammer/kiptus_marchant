import 'package:flutter/material.dart';
import 'package:kiptus_marchant/theme/style.dart';

class MyTextButton extends StatelessWidget {
  final String btnName;
  final String routeName;
  final Color textColor;

  const MyTextButton({@required this.btnName, this.routeName, this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName), 
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: new Text(
          btnName,
          style: kFontMidThinkTextStyle.copyWith(color: textColor),
        ),
      ),
    );
  }
}
