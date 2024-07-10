import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/login_provider.dart';
import 'package:task/provider/signup_provider.dart';

import 'package:task/view/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        )
      ],
      child: const MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
