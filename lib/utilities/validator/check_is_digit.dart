bool isMobile(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (regExp.hasMatch(value)) {
    return true;
  }

  return false;
}
