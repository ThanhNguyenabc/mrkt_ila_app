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

  static validPassword(String str) {
    final input = str.trim();
    return input.isNotEmpty && input.length >= 6;
  }

  static String? validatePassword(String? text) {
    if (text == null || text.isEmpty) return 'Password is required';
    return StringUtil.validPassword(text)
        ? null
        : 'Password must be at least 6 characters';
  }

  static String? validateNewPassword(String oldPassword, String? newPassword) {
    if (newPassword == null || newPassword.isEmpty) {
      return 'New password must not be empty ';
    }
    if (!StringUtil.validPassword(newPassword)) {
      return "Password must be at least 6 characters";
    }
    if (oldPassword.compareTo(newPassword) == 0) {
      return "Your new password is too similar to your current password";
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? confirmPassword, String newPassword) {
    if (confirmPassword == null) return 'Confirm Password is required';
    return newPassword.compareTo(confirmPassword) == 0
        ? null
        : "The password confirmation does not match";
  }
}
