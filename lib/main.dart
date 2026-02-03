import 'package:e_wallet/Auth/Signup/signupPage.dart';
import 'package:e_wallet/Auth/forgetPassword/forget_password.dart';
import 'package:e_wallet/Auth/login/loginPage.dart';
import 'package:e_wallet/Home/home.dart';
import 'package:e_wallet/Starting_page/startPage.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        textTheme: Theme.of(
          context,
        ).textTheme.apply(bodyColor: Pallet.text, displayColor: Pallet.text),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Pallet.background,
          selectionHandleColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
        )
      ),
      home: Container(
        decoration: BoxDecoration(gradient: Pallet.back),
        child: const Home(),
      ),
    );
  }
}
