class Validators {
  // Check if field is empty
  static String? isRequired(String? value, {String field = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$field is required";
    }
    return null;
  }

  // Validate Email
  static String? isEmail(String? value) {
    if (value == null || value.trim().isEmpty) return "Email is required";
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value.trim())) return "Invalid email address";
    return null;
  }

  // Validate Password
  static String? isPassword(String? value, {int minLength = 6}) {
    if (value == null || value.trim().isEmpty) return "Password is required";
    if (value.length < minLength) return "Password must be at least $minLength characters";
    return null;
  }

  // Confirm Password
  static String? confirmPassword(String? value, String? original) {
    if (value == null || value.trim().isEmpty) return "Confirm password is required";
    if (value != original) return "Passwords do not match";
    return null;
  }

  // Validate Number
  static String? isNumber(String? value) {
    if (value == null || value.trim().isEmpty) return "Field is required";
    final regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value.trim())) return "Must be a valid number";
    return null;
  }

  // Validate Text Length
  static String? minLength(String? value, int length, {String field = "Field"}) {
    if (value == null || value.trim().isEmpty) return "$field is required";
    if (value.trim().length < length) return "$field must be at least $length characters";
    return null;
  }

  static String? maxLength(String? value, int length, {String field = "Field"}) {
    if (value != null && value.trim().length > length) return "$field must not exceed $length characters";
    return null;
  }
}