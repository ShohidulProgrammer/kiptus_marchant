import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
    this.isPhone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 35.0),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Color(0xffe6e7e8),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(50.0),
            borderSide: new BorderSide(color: Colors.grey[100]),
          ),
          // border: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(50.0),
            borderSide: new BorderSide(color: Colors.grey[100]),
          ),
        ),
        obscureText: isPassword ? true : false,
        validator: validator ?? null,
        onSaved: onSaved,
        // keyboardType: keyboardType,
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : isPhone ? TextInputType.phone : TextInputType.text,
      ),
    );
  }
}
