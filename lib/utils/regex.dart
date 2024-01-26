class RegEx {
  bool isValidEnglishText(String text) {
    final RegExp englishTextRegex = RegExp(
      r'^[a-zA-Z ]+$',
    );
    return englishTextRegex.hasMatch(text);
  }

  bool isValidThaiText(String text) {
    final RegExp thaiTextRegex = RegExp(
      r'^[ก-๙ ]+$',
    );
    return thaiTextRegex.hasMatch(text);
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}
