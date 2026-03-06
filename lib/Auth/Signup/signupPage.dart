import 'package:cloud_firestore/cloud_firestore.dart';
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

      //  create auth user
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.text.trim(),
            password: password1.text.trim(),
          );

      final user = cred.user!;

      // save name in auth
      await user.updateDisplayName(name.text.trim());

      // save user in firestore
      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "uid": user.uid,
        "name": name.text.trim(),
        "email": email.text.trim(),
        'password': 1234,
        "createdAt": FieldValue.serverTimestamp(),
        "balance": 0,
      });

      Navigator.pushNamedAndRemoveUntil(context, "/entry", (route) => false);
    } catch (e, stack) {
      print("ERROR = $e");
      print(stack);
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
                  validator: (value) {
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
                Button(
                  text: 'Register',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      loading ? null : signup();
                    }
                  },
                  loading: loading,
                ),
                Gap(gap: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    AuthText(
                      text: "Login",
                      onTap: () {
                        Navigator.push(context, myRoute(LoginPage()));
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
