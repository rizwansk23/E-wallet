import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/profile_photo.dart';
import 'package:e_wallet/Component/toggleButton.dart';
import 'package:e_wallet/Home/Setting_pages/account.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(toolbarHeight: 60, backgroundColor: Pallet.secondaryBack),
      body: ListView(
        children: [
          Container(
            height: height * 0.3,
            decoration: BoxDecoration(
              color: Pallet.secondaryBack,
              borderRadius: Borders.bottomRadius,
            ),
            child: Column(
              children: [
                ProfilePhoto(image: 'assets/images/Logo/Logo2.png'),
                Gap(gap: 20),
                Text(
                  'Aliya Leon ',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
                Gap(gap: 15),
                Text('rizwan@gmail.com'),
              ],
            ),
          ),
          Gap(gap: 30),
          Option(icon: Icons.person,title: 'My Account',onTap: (){Navigator.push(context, myRoute(Account()));},),
          Option(icon: Icons.privacy_tip_sharp,title: 'Privacy & Policy',),
          Option(icon: CupertinoIcons.exclamationmark_circle_fill,title: 'Help & Center',onTap: ()async{await FirebaseAuth.instance.signOut();

          Navigator.pushReplacementNamed(context, "/entry");},),
          Option(icon: Icons.dark_mode_rounded,title: 'Dark mode',isToggle: true,),
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({super.key,required this.icon,required this.title , this.onTap , this.isToggle = false});

  final IconData icon;
  final String title;
  final bool ? isToggle;
  final VoidCallback? onTap ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Pallet.secondaryBack,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ListTile(
          iconColor: Colors.white54,
          textColor: Colors.white,
          leading: Container(
            width: 55,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: BoxBorder.all(color: Colors.white30),
              gradient: RadialGradient(
                radius: 2,
                colors: [Color(0xff3a2815), Colors.white],
              ),
            ),
            child: Icon(icon, color: Colors.white,size: 32,),
          ),
          title: Text(title, style: TextStyle(fontSize: 19)),
          trailing: isToggle! ? YellowToggleButton() : Icon(Icons.arrow_forward_ios_rounded) ,
          onTap: onTap,
        ),
      ),
    );
  }
}



