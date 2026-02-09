import 'package:e_wallet/Auth/login/loginPage.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:e_wallet/utils/formValidator.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password1 = TextEditingController();
  final TextEditingController password2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Pallet.background, toolbarHeight: 50),
        body: Container(
          decoration: BoxDecoration(gradient: Pallet.back),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.only(left: 20, right: 20),
              children: [
                H1(text: 'Register'),
                Gap(gap: 10),
                Text('create your account'),
                Gap(gap: 60),
                Input(
                  label: 'Name',
                  controller: name,
                  validator: FormValidators.nameValidator,
                ),
                Gap(gap: 20),
                Input(
                  label: 'E-mail',
                  controller: email,
                  validator: FormValidators.emailValidator,
                ),
                Gap(gap: 20),
                Input(
                  label: 'Password',
                  controller: password1,
                  isPassword: true,
                  validator: FormValidators.passwordValidator,
                ),
                Gap(gap: 20),
                Input(
                  label: 'Repeated Password',
                  controller: password2,
                  isPassword: true,
                  validator: FormValidators.passwordValidator,
                ),
                Gap(gap: 60),
                Button(text: 'Register', onTap: () {
                  if (_formKey.currentState!.validate()){
                    print('object');
                  }
                },),
                Gap(gap: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    AuthText(
                      text: "Login",
                      onTap: () {

                        // showSheet(context, Icons.check_box, 'Reset Successfully', 'Please re-login to get started', (){});
                        // showSheet(context, Icons.check_box, 'Check your email', 'We have sent a instructions to recover your password to your email', (){});

                        Navigator.push(
                          context,
                          myRoute(LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
