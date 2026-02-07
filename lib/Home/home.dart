import 'package:e_wallet/Auth/Signup/signupPage.dart';
import 'package:e_wallet/Auth/forgetPassword/forget_password.dart';
import 'package:e_wallet/Auth/login/loginPage.dart';
import 'package:e_wallet/Starting_page/startPage.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isActive = false;
  int _counter = 0;

  final List<Widget> page = [
    LoginPage(), //homepage
    SignupPage(), // contactpage
    ForgetPassword(), //qr page
    Startpage(),//profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: page[_counter],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: CircleBorder(),
          autofocus: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          onPressed: () {
            setState(() {
              isActive =! isActive;
            });
          },
          child: const Icon(Icons.add, color: Colors.white, size: 35),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.transparent,
              border: Border.all(
                // color: Color(0x12ffffff),
                color: Color(0xff473819),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavItem(
                  icon: Icons.home_filled,
                  label: 'Home',
                  index: 0,
                  selectedIndex: _counter,
                ),
                NavItem(
                  icon: Icons.assessment_outlined,
                  label: 'Analitic',
                  index: 1,
                  selectedIndex: _counter,
                ),
                const SizedBox(width: 60),
                NavItem(
                  icon: Icons.wallet,
                  label: 'wallet',
                  index: 2,
                  selectedIndex: _counter
                ),
                NavItem(
                  icon: Icons.settings_rounded,
                  label: 'setting',
                  index: 3,
                  selectedIndex: _counter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget NavItem({
    required IconData icon,
    required String label,
    required int index,
    required int selectedIndex,
  }) {

    bool isSelected = index == _counter;

    return GestureDetector(
      onTap: () {
        setState(() => _counter = index);
      },
      child: Tooltip(
        margin: EdgeInsets.all(20),
        preferBelow: false,
        message: label,
        child: Container(
          width: 80,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: isSelected ?  Pallet.yellow : Colors.transparent,
          ),
          child: Icon(icon, size: 32 , color: isSelected ? Colors.black : Colors.white  ),
        ),
      ),
    );
  }
}
