import 'package:flutter/material.dart';
import 'package:kiptus_marchant/model/user_model.dart';
import 'package:kiptus_marchant/router/constants.dart';
import 'package:kiptus_marchant/theme/style.dart';
import 'package:kiptus_marchant/utilities/validator/check_is_digit.dart';
import 'package:kiptus_marchant/utilities/validator/check_is_empty_field.dart';
import 'package:kiptus_marchant/widgets/my_text_button.dart';
import 'package:kiptus_marchant/widgets/my_text_field.dart';
import 'my_button_widget.dart';
import 'connect_with_image_buttons.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                        'Log In',
                        textAlign: TextAlign.center,
                        style: kBigBoldTextStyle,
                      ),
                      SizedBox(height: 20.0),
                      MyTextFormField(
                          hintText: 'Mobile Number or Email',
                          isEmail: true,
                          validator: EmptyFieldValidator.validate,
                          // validator: MobileFieldValidator.validate,
                          onSaved: (String value) {
                            isMobile(value)
                                ? user.mobile = value
                                : user.email = value;
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
                      MyButton(btnName: 'Log In', function: _submit),
                      MyTextButton(btnName: 'Forgot Password?'),
                      MyTextButton(
                        btnName: 'Create a new account',
                        textColor: Color(0xff069be5),
                        routeName: signUpRoute,
                      ),
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
      print(
          'Mobile: ${user.mobile}\nEmail: ${user.email}\nPassword: ${user.password}');
      Navigator.pushNamed(context, profilePageRoute, arguments: user);
    }
  }
}
