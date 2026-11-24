class Validators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? email(String? value) {
    final error = required(value);
    if (error != null) return error;

    final emailRegExp = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegExp.hasMatch(value!.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    final error = required(value);
    if (error != null) return error;

    if (value!.length < 7) {
      return 'Password must be at least 7 characters';
    }
    return null;
  }
}