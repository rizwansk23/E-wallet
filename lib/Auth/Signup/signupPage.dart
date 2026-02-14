import 'package:e_wallet/Auth/login/loginPage.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/Starting_page/startPage.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,toolbarHeight:40),
        // backgroundColor: Colors.transparent,
        body:ListView(
          padding: const EdgeInsets.only(left: 20,right: 20),
            children: [
              H1(text: 'Register'),
              Gap(gap: 10),
              Text('create your account'),
              Gap(gap: 60),
              Input(label: 'Name', controller: name),
              Gap(gap: 20),
              Input(label: 'E-mail', controller: email),
              Gap(gap: 20),
              Input(label: 'Password', controller: password1,isPassword: true,),
              Gap(gap: 20),
              Input(label: 'Repeated Password', controller: password2 ,isPassword: true,),
              Gap(gap: 60),
              Button(text: 'Register'),
              Gap(gap: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  AuthText(text: "Login" , onTap: (){
                  },),
                ],
              )
            ],
        )
      ),
    );
  }
}
