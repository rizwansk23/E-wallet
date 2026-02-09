import 'package:e_wallet/Auth/login/loginPage.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/Component/showSheet.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:e_wallet/utils/formValidator.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Pallet.background),
        body: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(gradient: Pallet.back),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                H1(text: 'New password'),
                Gap(gap: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'Your new password must be different from previous used password.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Gap(gap: 40),
                Input(
                  label: 'New Password',
                  controller: newPassword,
                  validator: FormValidators.passwordValidator,
                  isPassword: true,
                ),
                Gap(gap: 20),
                Input(
                  label: 'Repeat Password',
                  controller: repeatPassword,
                  validator: FormValidators.passwordValidator,
                  isPassword: true,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 100,
            padding: EdgeInsets.all(20),
            color: Pallet.background,
            child: Button(
              text: 'Repeat Password',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (!(newPassword.text.trim() ==
                      repeatPassword.text.trim())) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text('please enter correct password'),
                      ),
                    );
                  } else {
                    showSheet(
                      context,
                      Icons.check_box,
                      'Reset Successfully',
                      'Please re-login to get started',
                      () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          myRoute(LoginPage()),
                          (route) => false,
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
