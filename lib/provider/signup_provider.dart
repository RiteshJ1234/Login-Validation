import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  bool _confirmFlag = true;
  bool _passwordFlag = true;

  bool get confirmFlag => _confirmFlag;
  bool get passwordFlag => _passwordFlag;

  @override
  void dispose() {
    userNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.dispose();
  }

  void clearTextController() {
    userNameTextEditingController.clear();
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    confirmPasswordTextEditingController.clear();
  }

  void setConfirmFlag() {
    _confirmFlag = !_confirmFlag;
    notifyListeners();
  }

  void setPasswordFlag() {
    _passwordFlag = !_passwordFlag;
    notifyListeners();
  }

  String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter Username";
    }
    if (value.length < 6) {
      return "Username should be atleast 6 characters";
    } else {
      return null;
    }
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

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter confirm password";
    }

    if (value != passwordTextEditingController.text) {
      return "Please enter correct password";
    } else {
      return null;
    }
  }
}
