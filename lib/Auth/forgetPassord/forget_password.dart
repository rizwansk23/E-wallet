import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,toolbarHeight: 40,),
        backgroundColor: Colors.transparent,
          body: ListView(
                padding: EdgeInsets.only(right: 20 , left: 20),
                children: [
                  H1(text: 'Forgot Password'),
                  Gap(gap: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('Enter your email account to reset your password',style: TextStyle(fontSize: 16),),
                  ),
                  Gap(gap: 40),
                  Input(label: 'Email', controller: email),
                  Gap(gap: 500),
                  Button(text: 'Next'),
                  ],
              ),
          ),
    );
  }
}
