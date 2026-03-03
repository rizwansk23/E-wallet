import 'package:e_wallet/Auth/login/loginPage.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:e_wallet/utils/formValidator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  
  bool loading = false;

  Future<void> signup() async {
    try {
      setState(() => loading = true);



      // 🔥 create account
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password1.text.trim(),
      );

      // 🔥 save name
      await cred.user!.updateDisplayName(name.text.trim());

      // refresh user
      await cred.user!.reload();


      Navigator.pushNamedAndRemoveUntil(context, "/entry",(route)=> false);

    } on FirebaseAuthException catch (e) {

      String msg = "Login failed";

      if (e.code == 'user-not-found' || e.code == 'wrong-password') msg = "Something went wrong";

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(msg)));

    } finally {
      setState(() => loading = false);
    }
  }

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
                  validator:(value){
                    if (value!.isEmpty || value == '') {
                      return 'Please enter password';
                    }
                    if (value != password1.text) {
                      return 'Password Do Not Match';
                    }
                    return null;
                  },
                ),
                Gap(gap: 60),
                Button(text: 'Register', onTap: () {
                  if (_formKey.currentState!.validate()){
                    loading ? null : signup();
                  }
                },loading: loading,),
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
