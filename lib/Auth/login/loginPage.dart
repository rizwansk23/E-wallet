import 'package:e_wallet/Auth/Signup/signupPage.dart';
import 'package:e_wallet/Auth/forgetPassword/forget_password.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:e_wallet/utils/formValidator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Pallet.background, toolbarHeight: 50),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(gradient: Pallet.back),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.only(right: 20, left: 20),
              children: [
                H1(text: 'Sign in to your Account'),
                Gap(gap: 10),
                Text('Sign in to your Account'),
                Gap(gap: 60),
                Input(
                  label: 'Name',
                  controller: name,
                  validator: FormValidators.nameValidator,
                ),
                Gap(gap: 20),
                Input(
                  label: 'password',
                  controller: password,
                  isPassword: true,
                  validator: FormValidators.passwordValidator,
                ),
                Gap(gap: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AuthText(
                      text: 'Forget password ?',
                      onTap: () {
                        Navigator.push(
                          context,
                          myRoute(ForgetPassword()),
                          // MaterialPageRoute(
                          //   builder: (context) => ForgetPassword(),
                          // ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(gap: 60),
                Button(text: 'Login', onTap: () {
                  if(_formKey.currentState!.validate()){
                    print('Login');
                  }
                },),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    AuthText(
                      text: "Register",
                      onTap: () {
                        Navigator.push(
                          context,
                          myRoute(SignupPage()),
                          // MaterialPageRoute(builder: (context) => SignupPage()
                          // )
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
