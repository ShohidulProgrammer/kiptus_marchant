import 'package:flutter/material.dart';
import 'package:kiptus_marchant/theme/style.dart';

class MyButton extends StatelessWidget {
  final btnName;
  final Function function;

  MyButton({@required this.btnName, this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: RaisedButton(
          child: Text(
            btnName,
            style: kButtonTextStyle,
          ),
          onPressed: function,
          padding: EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 5.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0),
          ),
          splashColor: Colors.grey,
        ),
      ),
    );
  }
}
