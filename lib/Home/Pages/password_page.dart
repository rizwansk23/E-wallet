import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/Auth/forgetPassword/change_password.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Home/Pages/payment_success.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  final String id;
  final String senderName;
  final int amount;

  const PasswordPage({
    super.key,
    required this.id,
    required this.senderName,
    required this.amount,
  });

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance.collection("users").doc(uid).get();
  }

  Future<void> updateBalance(String userId, int amount) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'balance': FieldValue.increment(amount),
        'lastTransaction': DateTime.now(),
      });
    } on Exception catch (e) {
      // TODO
      print('error : $e');
    }
  }

  Future createTransaction(String id, String senderName, int amount) async {
    DocumentReference ref = await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("transactions")
        .add({
          'name': senderName,
          "amount": amount,
          "type": 'receiver',
          "date": Timestamp.now(),
        });

    String Transactionid = ref.id;
    return Transactionid;
  }

  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();

  final f1 = FocusNode();
  final f2 = FocusNode();
  final f3 = FocusNode();
  final f4 = FocusNode();

  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
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
          return Scaffold(
            appBar: AppBar(backgroundColor: Pallet.background),
            body: Container(
              decoration: BoxDecoration(gradient: Pallet.back),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  H1(text: 'Enter Pin'),
                  Gap(gap: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OtpField(num: num1, currentFocus: f1, nextFocus: f2),
                      OtpField(
                        num: num2,
                        currentFocus: f2,
                        previousFocus: f1,
                        nextFocus: f3,
                      ),
                      OtpField(
                        num: num3,
                        currentFocus: f3,
                        previousFocus: f2,
                        nextFocus: f4,
                      ),
                      OtpField(num: num4, currentFocus: f4, previousFocus: f3),
                    ],
                  ),
                  Gap(gap: 20),
                ],
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 100,
                color: Pallet.background,
                child: Button(
                  text: 'Next',
                  onTap: isProcessing
                      ? null
                      : () async {
                          setState(() {
                            isProcessing = true;
                          });

                          final otpList = [
                            num1.text,
                            num2.text,
                            num3.text,
                            num4.text,
                          ];

                          String password = otpList.join();

                          await Future.delayed(const Duration(seconds: 2));

                          if (data?["password"] == password) {
                            if (widget.amount > data!['balance']) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('insufficient balance'),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Navigator.pop(context);
                              return;
                            }
                            String transactionId = await createTransaction(
                              widget.id,
                              widget.senderName,
                              widget.amount,
                            );

                            await updateBalance(widget.id, widget.amount);
                            await updateBalance(data!['uid'], -widget.amount);

                            if (mounted) {
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                              Navigator.push(
                                context,
                                myRoute(
                                  PaymentSuccess(
                                    id: widget.id,
                                    amount: widget.amount,
                                    transactionId: transactionId,
                                  ),
                                ),
                              );
                            }
                          } else {
                            if (mounted) {
                              setState(() {
                                isProcessing = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('PIN does not match!'),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          }
                        },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  final TextEditingController num;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final FocusNode? previousFocus;

  const OtpField({
    super.key,
    required this.num,
    required this.currentFocus,
    this.nextFocus,
    this.previousFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: RadialGradient(
          radius: 3,
          colors: [Color(0xff3a2815), Colors.white],
        ),
      ),
      width: 80,
      height: 65,
      child: TextFormField(
        controller: num,
        focusNode: currentFocus,
        decoration: InputDecoration(
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          contentPadding: EdgeInsets.all(10),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30, color: Colors.white),
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        cursorHeight: 30,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty && nextFocus != null) {
            nextFocus!.requestFocus();
          } else if (value.isEmpty && previousFocus != null) {
            previousFocus!.requestFocus();
          }
        },
        // focusNode: FocusNode(),
      ),
    );
  }
}
