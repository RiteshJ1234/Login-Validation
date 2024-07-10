import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool _flag = true;
  bool get flag => _flag;

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  void clearTextController() {
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
  }

  void setFlag() {
    _flag = !_flag;
    notifyListeners();
  }

  String? emailValidator(String? value) {
    if (!EmailValidator.validate(value!)) {
      return "Please enter email";
    }
    if (value.length < 6) {
      return "Username should be atleast 6 characters";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    } else {
      return null;
    }
  }
}
