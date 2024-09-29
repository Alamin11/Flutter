extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp =
        RegExp(r"^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final emailRegExp =
        RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final emailRegExp = RegExp(r"^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidUsername {
    final emailRegExp = RegExp(r"^[A-Za-z][A-Za-z0-9_]{7,29}$");
    return emailRegExp.hasMatch(this);
  }
}
