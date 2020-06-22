import 'package:flutter/material.dart';
import 'package:kiptus_marchant/model/user_model.dart';
import 'package:kiptus_marchant/router/constants.dart';
import 'package:kiptus_marchant/theme/style.dart';
import 'package:kiptus_marchant/utilities/validator/check_is_empty_field.dart';
import 'package:kiptus_marchant/utilities/validator/mobile_validator.dart';

import 'package:kiptus_marchant/widgets/my_text_field.dart';
import 'my_button_widget.dart';
import 'connect_with_image_buttons.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: kBigBoldTextStyle,
                      ),
                      SizedBox(height: 20.0),
                      MyTextFormField(
                        hintText: 'Name',
                        validator: EmptyFieldValidator.validate,
                        onSaved: (String value) {
                          user.userName = value;
                        },
                      ),
                      SizedBox(height: 20.0),
                      MyTextFormField(
                          hintText: 'Mobile Number',
                          isPhone: true,
                          validator: MobileFieldValidator.validate,
                          onSaved: (String value) {
                            user.mobile = value;
                          }),
                      SizedBox(height: 20.0),
                      MyTextFormField(
                          hintText: 'Password',
                          isPassword: true,
                          validator:
                              // PasswordFieldValidatorForSignup.validate,
                              (String value) {
                            if (value.length < 6) {
                              return 'Password should be minimum 6 characters';
                            }
                            _formKey.currentState.save();
                            return null;
                          },
                          onSaved: (String value) {
                            user.password = value;
                          }),
                      SizedBox(height: 20.0),
                      MyButton(btnName: 'Submit', function: _submit),
                      SizedBox(height: 32.0),
                      Text(
                        'Connect with',
                        style: kFontMidThinkTextStyle,
                      ),
                      connectWithImageButtons(),
                    ],
                  )),
            )),
      ),
    );
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.pushNamed(context, otpInputPageRoute, arguments: user);
    }
  }
}
