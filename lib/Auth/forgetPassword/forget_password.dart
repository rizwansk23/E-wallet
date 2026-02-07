import 'package:e_wallet/Auth/forgetPassword/otp_page.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:e_wallet/utils/formValidator.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController email = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Pallet.background),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(gradient: Pallet.back),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.only(right: 20, left: 20),
              children: [
                H1(text: 'Forgot Password'),
                Gap(gap: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'Enter your email account to reset your password',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Gap(gap: 40),
                Input(
                  label: 'Email',
                  controller: email,
                  validator: FormValidators.emailValidator,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(20),
            color: Pallet.background,
            child: Button(text: 'Next', onTap: () {
              if(_formKey.currentState!.validate()){
                print('forget password');
                Navigator.push(context, myRoute(OtpPage()));
              }
            },),
          ),
        ),
      ),
    );
  }
}
