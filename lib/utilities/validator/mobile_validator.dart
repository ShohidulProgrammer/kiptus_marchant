class MobileFieldValidator {
  static String validate(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length < 11 || 15 < value.length) {
      return 'Please enter a valid Mobile Number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }

    return null;
  }
}
