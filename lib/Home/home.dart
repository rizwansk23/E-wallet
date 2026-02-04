
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,),
        backgroundColor: Colors.transparent,
        body: ListView(
          padding:EdgeInsets.all(20) ,

          children: [

          ],
        ),
      ),
    );
  }
}
