import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiptus_marchant/theme/style.dart';
import 'package:kiptus_marchant/widgets/my_button_widget.dart';

class UploadProductImage extends StatefulWidget {
  @override
  _UploadProductImageState createState() => _UploadProductImageState();
}

class _UploadProductImageState extends State<UploadProductImage> {
  File _image;

  Future uploadImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
    
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        imageContainer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MyButton(btnName: 'Browse', function: uploadImage),
            SizedBox(width: 30.0),
            MyButton(
                btnName: 'Capture',
                function: () {
                  getImage();
                }),
          ],
        ),
      ],
    );
  }

  Widget imageContainer() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 50.0, bottom: 20.0, left: 30.0, right: 30.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.3,
        child: FlatButton(
          color: Color(0xffe6e7e8),
          padding: EdgeInsets.all(2.0),
          onPressed: uploadImage,
          child: _image == null
              ? Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Text(
                    'Click/Upload your product',
                    style: kLeargeTextStyle,
                  ),
                )
              : Container(
                  child: Image.file(
                    _image,
                    fit: BoxFit.cover,
                    // width: MediaQuery.of(context).size.width / 3,
                    // width: double.infinity,
                    // height: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
