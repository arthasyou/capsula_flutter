class InputValidator {
  // Validate email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Regular expression for validating an email
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    // Regular expression for validating a phone number
    final RegExp phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // Validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  // Validate required field
  static String? validateRequiredField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  // Validate if input contains a digit, a letter, or a special character
  static String? validateDigitLetterSpecialChar(String? value) {
    if (value == null || value.isEmpty) {
      return 'Input cannot be empty';
    }
    final RegExp digitRegExp = RegExp(r'\d');
    final RegExp letterRegExp = RegExp(r'[a-zA-Z]');
    final RegExp specialCharRegExp = RegExp(r'[!@#\$&*~]');

    if (!digitRegExp.hasMatch(value) ||
        !letterRegExp.hasMatch(value) ||
        !specialCharRegExp.hasMatch(value)) {
      return 'Input must contain at least one digit, one letter, and one special character';
    }
    return null;
  }
}
