import 'package:e_wallet/Auth/authpage.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
