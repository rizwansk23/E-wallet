import 'package:e_wallet/Auth/forgetPassword/otp_page.dart';
import 'package:e_wallet/Home/Pages/notification_page.dart';
import 'package:e_wallet/Home/Pages/password_page.dart';
import 'package:e_wallet/Home/Pages/payment_success.dart';
import 'package:e_wallet/Home/Pages/scanner.dart';
import 'package:e_wallet/Home/Pages/transfer_page.dart';
import 'package:e_wallet/Home/card_page.dart';
import 'package:e_wallet/Home/first_page.dart';
import 'package:e_wallet/Home/setting_page.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isActive = false;
  int _counter = 0;

  final user = FirebaseAuth.instance.currentUser;



  final List<Widget> page = [
    FirstPage(),
    OtpPage(),
    CardPage(),
    SettingPage(),
  ];


  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;

    if (await Permission.camera.request().isGranted) {
      Navigator.push(context ,myRoute(QRScannerScreen()));
    }

    if (status.isDenied) {
      if (await Permission.camera.request().isGranted) {
        Navigator.push(context ,myRoute(QRScannerScreen()));
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Pallet.back
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(

              tooltip: 'Notification',
              onPressed: () {
                Navigator.push(context, noticeRoute(NotificationPage()));
              },
              icon: Icon(CupertinoIcons.bell,size: 24,),
            ),
          ],
          actionsPadding: EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: _counter == 3
              ? Pallet.secondaryBack
              : Pallet.background,
          title: _counter == 2
              ? Text('Card', style: TextStyle(fontSize: 25, color: Colors.white))
              : _counter == 0
              ? Text.rich(
                  TextSpan(
                    text: 'Hello,  ',
                    style: TextStyle(color: Pallet.orange),

                    children: <TextSpan>[
                      TextSpan(
                        text: user?.displayName ?? "User",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              : null,
          centerTitle: _counter == 2 ? true : false,
        ),

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
              _requestCameraPermission();
              setState(() {
                isActive = !isActive;
              });
            },
            child: const Icon(Icons.add, color: Colors.white, size: 35),
          ),
        ),

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                    selectedIndex: _counter,
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
            color: isSelected ? Pallet.yellow : Colors.transparent,
          ),
          child: Icon(
            icon,
            size: 32,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
