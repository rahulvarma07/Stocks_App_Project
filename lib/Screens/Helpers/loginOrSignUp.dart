import 'package:flutter/material.dart';
import 'package:stockproject/Screens/Auth/loginScreen.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
