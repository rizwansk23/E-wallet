import 'package:flutter/cupertino.dart';

class FormValidators {
    static String? emailValidator(String? value) {
    final emailReg = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-z]{2,4}$');

    if (value!.isEmpty || value == '') {
      return 'Please enter Email';
    }

    if (!emailReg.hasMatch(value)) {
      return "please enter a valid email";
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty || value == '') {
      return 'Please enter Password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }
}
