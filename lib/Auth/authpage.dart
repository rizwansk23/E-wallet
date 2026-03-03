import 'package:e_wallet/Auth/Signup/signupPage.dart';
import 'package:e_wallet/Auth/login/loginPage.dart';
import 'package:e_wallet/Home/home.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Starting_page/startpage.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _decideRoute();
    });
  }

  Future<void> _decideRoute() async {
    final prefs = await SharedPreferences.getInstance();
    bool seenIntro = prefs.getBool('seenIntro') ?? false;

    if (!seenIntro) {
      _go(const StartPage());
      return;
    }

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      _go(const LoginPage());
    } else {
      _go(Home());
    }
  }

  void _go(Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
