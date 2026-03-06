import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/profile_photo.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccess extends StatefulWidget {
  final String id;
  final String transactionId;
  final int amount;
  const PaymentSuccess({
    super.key,
    required this.id,
    required this.transactionId,
    required this.amount,
  });

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(widget.id)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: Pallet.back),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Pallet.background),
        body: FutureBuilder(
          future: getUser(),
          builder: (context, asyncSnapshot) {

            if (!asyncSnapshot.hasData || asyncSnapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            }

            final data = asyncSnapshot.data!.data();

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Lottie.asset(
                  'assets/animation/Success.json',
                  repeat: false,
                  height: 250,
                  frameRate: FrameRate(90),
                ),
                Text(
                  'Send money Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Gap(gap: 15),
                Text(
                  'Your transfer has been processed',
                  textAlign: TextAlign.center,
                ),
                Gap(gap: 70),
                Container(
                  padding: EdgeInsets.all(3),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Stack(
                    alignment: AlignmentGeometry.centerLeft,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 1, height: 100),
                          Text(
                            data!['name'].toString().toUpperCase(),
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            '\u20B9 ${widget.amount}',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: -20,
                        height: 64,
                        child: Container(
                          decoration: BoxDecoration(
                            border: BoxBorder.all(width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: ProfilePhoto(
                            image: 'assets/images/Logo/Logo2.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(gap: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transaction ID '),
                    Text(
                      'dksguisa',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
                Gap(gap: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Date & Time'), Text('dksguisa')],
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 120,
            padding: EdgeInsets.all(20),
            child: Button(
              text: "Done",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
