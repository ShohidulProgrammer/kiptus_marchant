class EmptyFieldValidator {
  static String validate(String value) {
    if (value.length < 2) {
      return 'Field can\'t be empty';
    }
    return null;
  }
}
