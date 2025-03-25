class AppRegex {
  static bool isAlphanumeric(String input) {
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumeric.hasMatch(input);
  }
}
