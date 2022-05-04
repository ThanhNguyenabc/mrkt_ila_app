import 'dart:convert';

class StringUtil {
  static Map<String, dynamic> safeParse(String source) {
    try {
      return jsonDecode(source);
    } catch (e) {
      return {};
    }
  }

  static bool validateEmail(String str) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(str.trim());
  }

  static validatePassword(String str) {
    final input = str.trim();
    return input.isNotEmpty && input.length >= 6;
  }
}
