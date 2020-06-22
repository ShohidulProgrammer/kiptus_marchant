import 'package:random_string/random_string.dart';
import 'package:sms/sms.dart';

String generateAndSendOTP(String mobile) {
  String otpCode = randomNumeric(4);
  String message = ' Your OTP code is: $otpCode';
  print(message);
  SmsSender sender = new SmsSender();
  SmsMessage smsMessage = SmsMessage(mobile, message);
  sender.sendSms(smsMessage);
  return otpCode;
}
