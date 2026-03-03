import 'package:e_wallet/Component/button.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/Component/profile_photo.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/formValidator.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
            Container(
              height: height * 0.5,
              decoration: BoxDecoration(
                color: Pallet.secondaryBack,
                borderRadius: Borders.bottomRadius
              ),
              child: Column(
                children: [
                  Gap(gap: 20),
                  ProfilePhoto(image: 'assets/images/Logo/Logo2.png'),
                  Gap(gap: 20),
                  Text(
                    'Aliya Leon ',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Gap(gap: 15),
                  Text('7400327510'),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white30,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gapPadding: 40,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
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
                  Text('Transfer on Date'),
                  Gap(gap: 20),
                  Container(
                    height: 55,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/master_card.png'),
                        Text('**** 7988'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(gap: 60),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Input(
                label: 'Add Description',
                controller: name,
                validator: FormValidators.nameValidator,
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 120,
            padding: EdgeInsets.all(20),
            child: Button(text: 'Transfer Money', onTap: () {}),
          ),
        ),
      ),
    );
  }
}
