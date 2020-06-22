import 'package:flutter/material.dart';
import 'package:kiptus_marchant/model/user_model.dart';
import 'package:kiptus_marchant/router/constants.dart';
import 'package:kiptus_marchant/theme/style.dart';
import 'package:kiptus_marchant/utilities/generate_and_send_otp_sms.dart';
import 'package:kiptus_marchant/widgets/my_button_widget.dart';
import 'package:kiptus_marchant/widgets/logo_login_screen.dart';
import 'package:kiptus_marchant/widgets/my_otp_text_field.dart';
import 'package:otp_count_down/otp_count_down.dart';

class OTPInputPage extends StatefulWidget {
  final User user;

  OTPInputPage({@required this.user});

  @override
  _OTPInputPageState createState() => _OTPInputPageState();
}

class _OTPInputPageState extends State<OTPInputPage> {
  String otp;
  OTPCountDown _otpCountDown;
  final int _otpTimeInMS = 1000 * 1 * 60;
  String _countDown = '1:00';

  @override
  void initState() {
    otp = generateAndSendOTP(widget.user.mobile);
    _startCountDown();
    super.initState();
  }

  void _startCountDown() {
    _otpCountDown = OTPCountDown.startOTPTimer(
      timeInMS: _otpTimeInMS,
      currentCountDown: (String countDown) {
        _countDown = countDown.substring(3);
        if (!mounted) return;
        setState(() {});
      },
      onFinish: () {
        otp = 'timeOut';
        _countDown = otp;
        print("Count down finished!");
      },
    );
  }

  @override
  void dispose() {
    _otpCountDown.cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned.fill(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * .12),
              MyLogo(),
              Text(
                'OTP',
                style: kLargeMidThinkTextStyle,
              ),
              SizedBox(height: 20.0),
              PinEntryTextField(
                  showFieldAsBox: true, onSubmit: _buildOtpSubmit),
              SizedBox(height: 16.0),
              Text(
                'Enter 4 Digit Code $_countDown',
                style: kSmallThinkTextStyle,
              ),
              SizedBox(height: 16.0),
              // resend and confirm button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MyButton(btnName: 'Resend', function: _resendOtp),
                  SizedBox(width: 30.0),
                  MyButton(btnName: 'Confirm', function: () {}),
                ],
              ),
            ],
          ),
        ),
      )
    ]));
  }

  _resendOtp() {
    _otpCountDown.cancelTimer();
    otp = generateAndSendOTP(widget.user.mobile);
    _startCountDown();
  }

  _buildOtpSubmit(String pin) {
    String otpVarificationStatus = pin == otp ? 'Verified' : 'Invalid';
    otpVarificationStatus == 'Invalid'
        ? showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Pin"),
                content: Text('You Inputed $otpVarificationStatus OTP'),
              );
            })
        : Navigator.pushNamed(context, profilePageRoute); //end showDialog()
  } // end onSubmit
}
