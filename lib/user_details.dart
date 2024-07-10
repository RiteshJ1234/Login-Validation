import 'package:flutter/material.dart';

class UserDetails extends InheritedWidget {
  final String userName;
  final String email;
  final String password;
  const UserDetails(
      {super.key,
      required this.userName,
      required this.email,
      required this.password,
      required super.child});

  static UserDetails? Of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserDetails>();
  }

  @override
  bool updateShouldNotify(UserDetails oldWidget) {
    return (oldWidget.userName != userName ||
        oldWidget.email != email ||
        oldWidget.password != password);
  }
}
