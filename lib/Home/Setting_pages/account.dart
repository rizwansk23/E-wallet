import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/Component/profile_photo.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final TextEditingValue name = TextEditingValue(text: 'Hello, World!');
  final TextEditingValue email = TextEditingValue(text: 'rizwan@gmail.com');
  final TextEditingValue password = TextEditingValue(text: 'bdbkjads');
  final TextEditingValue repeatPassword = TextEditingValue(text: 'dbqhdjahn');

  @override
  Widget build(BuildContext context) {

    final TextEditingController _namecontroller =
        TextEditingController.fromValue(name);
    final TextEditingController _emailcontroller =
        TextEditingController.fromValue(email);
    final TextEditingController _passcontroller =
        TextEditingController.fromValue(password);
    final TextEditingController _repeatpasscontroller =
        TextEditingController.fromValue(repeatPassword);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: Pallet.back
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Account'),
            centerTitle: true,
            foregroundColor: Colors.white,
            backgroundColor: Pallet.background,
          ),
          body: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Column(
                spacing: 20,
                children: [
                  ProfilePhoto(image: 'assets/images/Logo/Logo2.png'),
                  Gap(gap: 30),
                  Input(label: 'name', controller: _namecontroller),
                  Input(label: 'Email', controller: _emailcontroller),
                  Input(label: 'Password', controller: _passcontroller,isPassword: true,),
                  Input(
                    label: 'Repeat Password',
                    controller: _repeatpasscontroller,
                    isPassword: true,
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              height: 120,
              padding: EdgeInsets.all(20),
              child: Button(text: 'Update Information', onTap: () {}),
            ),
          ),
        ),
      ),
    );
  }
}
