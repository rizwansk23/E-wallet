import 'package:e_wallet/Auth/Signup/signupPage.dart';
import 'package:e_wallet/Auth/authpage.dart';
import 'package:e_wallet/Home/Pages/notification_page.dart';
import 'package:e_wallet/Home/Pages/payment_success.dart';
import 'package:e_wallet/Home/Pages/receive_page.dart';
import 'package:e_wallet/Home/Pages/transfer_page.dart';
import 'package:e_wallet/Home/card_page.dart';
import 'package:e_wallet/Auth/authpage.dart';
import 'package:e_wallet/Home/home.dart';
import 'package:e_wallet/Home/setting_page.dart';
import 'package:e_wallet/Starting_page/startpage.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(); // 🔥 IMPORTANT

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
        ),
      ),
      routes: {
        "/entry": (_) => const AuthPage(),
      },
      home: Container(
        decoration: BoxDecoration(
          gradient: Pallet.back
        ),
        child: const AuthPage(),
      ),
    );
  }
}
