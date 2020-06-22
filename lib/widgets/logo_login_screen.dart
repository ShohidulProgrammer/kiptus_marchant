//kiptus logo widget
import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(
        top: 10,
      ),
      // padding: EdgeInsets.only(top: 120),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        // height: 240,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                  // height: 154,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('assets/kiptus.png')),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}

