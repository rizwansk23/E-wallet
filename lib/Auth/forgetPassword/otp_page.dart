import 'package:e_wallet/Auth/forgetPassword/change_password.dart';
import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();

  final f1 = FocusNode();
  final f2 = FocusNode();
  final f3 = FocusNode();
  final f4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Pallet.background),
        body: Container(
          decoration: BoxDecoration(gradient: Pallet.back),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              H1(text: 'OTP Verification'),
              Gap(gap: 10),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  'Please check your email to see the verification code',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Gap(gap: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OtpField(
                      num: num1,
                      currentFocus: f1,
                      nextFocus: f2
                  ),
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
                  OtpField(
                      num: num4,
                      currentFocus: f4,
                      previousFocus: f3
                  ),
                ],
              ),
              Gap(gap: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Send code reload in'),
                  Text('data', style: TextStyle(color: Pallet.yellow)),
                ],
              ),
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
              onTap: () {
                final otp =[];
                otp.add(int.parse(num1.text));
                otp.add(int.parse(num2.text));
                otp.add(int.parse(num3.text));
                otp.add(int.parse(num4.text));

                print(otp);
                Navigator.push(context, myRoute(ChangePassword()));
              },
            ),
          ),
        ),
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
