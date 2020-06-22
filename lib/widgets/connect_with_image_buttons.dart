import 'package:flutter/material.dart';
import 'my_image_button.dart';

Widget connectWithImageButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      MyImageButton(
        btnAddress: 'fb.png',
      ),
      MyImageButton(
        btnAddress: 'google.png',
      ),
      MyImageButton(
        btnAddress: 'wizdoor.png',
      ),
    ],
  );
}
