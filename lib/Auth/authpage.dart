import 'package:e_wallet/Auth/Signup/signupPage.dart';
import 'package:flutter/material.dart';
import '../Starting_page/startpage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool isNewUser = true;

  void _updateData(bool newData) {
    setState(() {
      isNewUser = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isNewUser) {
      return StartPage(onDataReceived: _updateData);
    } else {
      return SignupPage();
    }
  }
}
