import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/Component/profile_photo.dart';
import 'package:e_wallet/Home/Pages/password_page.dart';
import 'package:e_wallet/Home/Pages/payment_success.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:e_wallet/utils/formValidator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferPage extends StatefulWidget {
  final String receiver_Uid;
  const TransferPage({super.key, required this.receiver_Uid});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final user = FirebaseAuth.instance.currentUser!.displayName;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(widget.receiver_Uid)
        .get();
  }

  DateTime now = DateTime.now();
  late String formattedDate = DateFormat('MMMM-dd-yyyy').format(now);

  final random = Random().nextInt(10000) + 1;

  final TextEditingController name = TextEditingController();
  final TextEditingController _rupee = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: FutureBuilder(
        future: getUser(),
        builder: (context, asyncSnapshot) {
          if (!asyncSnapshot.hasData || asyncSnapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }

          final data = asyncSnapshot.data!.data();
          return Container(
            decoration: BoxDecoration(gradient: Pallet.back),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Confirm Transfer',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                centerTitle: true,
                backgroundColor: Pallet.secondaryBack,
              ),
              body: ListView(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      height: height * 0.5,
                      decoration: BoxDecoration(
                        color: Pallet.secondaryBack,
                        borderRadius: Borders.bottomRadius,
                      ),
                      child: Column(
                        children: [
                          Gap(gap: 20),
                          ProfilePhoto(image: 'assets/images/Logo/Logo2.png'),
                          Gap(gap: 20),
                          Text(
                            data!['name'].toString().toUpperCase(),
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          Gap(gap: 15),
                          Text(user!),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: TextFormField(
                                controller: _rupee,
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return 'Please enter Amount';
                                  }

                                  if (value.isEmpty) {
                                    return 'Amount must be in 1 character';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white30,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    gapPadding: 40,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    gapPadding: 40,
                                  ),
                                  prefixText: '\u20B9',
                                  prefixStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text('Transfer on Date $formattedDate'),
                          Gap(gap: 20),
                          Container(
                            height: 55,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/master_card.png'),
                                Text('**** $random'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(gap: 60),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Input(
                      label: 'Add Description',
                      controller: name,
                      // validator: FormValidators.nameValidator,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SafeArea(
                child: Container(
                  height: 120,
                  padding: EdgeInsets.all(20),
                  child: Button(
                    text: 'Transfer Money',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          myRoute(
                            PasswordPage(
                              id: data['uid'],
                              senderName: user!,
                              amount: int.parse(_rupee.text),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
