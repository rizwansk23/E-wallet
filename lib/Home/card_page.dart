import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/input.dart';
import 'package:e_wallet/Component/obscureText.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final TextEditingValue name = TextEditingValue(text: 'Your name');
  final TextEditingValue number = TextEditingValue(text: '27126876298');
  final TextEditingValue date = TextEditingValue(text: '11/26');
  final TextEditingValue cvv = TextEditingValue(text: '425');

  final TextEditingController _nameController =
  TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = "Your name";
  }


  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    _nameController.text = 'name';
  }

  @override
  Widget build(BuildContext context) {

    final TextEditingController _numberController =
        TextEditingController.fromValue(number);
    final TextEditingController _dateController =
        TextEditingController.fromValue(date);
    final TextEditingController _cvvController =
        TextEditingController.fromValue(cvv);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Card', style: TextStyle(fontSize: 25)),
        //   centerTitle: true,
        //   backgroundColor: Pallet.background,
        //   foregroundColor: Colors.white,
        // ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Card(
              name: _nameController.text,
              number: _numberController.text,
              date: _dateController.text,
            ),
            Gap(gap: 60),
            Input(label: 'name', controller: _nameController),
            Gap(gap: 20),
            Input(label: 'Card Number', controller: _numberController),
            Gap(gap: 20),
            SizedBox(
              width: double.infinity,
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Input(
                      label: 'Expiry Date',
                      controller: _dateController,
                    ),
                  ),
                  Expanded(
                    child: Input(
                      label: '3-Digit CVV',
                      controller: _cvvController,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  const Card({super.key, required this.name, this.date, this.number});

  final String name;
  final String? number;
  final String? date;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0x99776B5C),
        borderRadius: BorderRadius.all(Radius.circular(40)),
        border: BoxBorder.all(color: Colors.white30),
      ),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Visa card'),
              Image.asset('assets/images/Visa_logo.png', width: 80),
            ],
          ),
          Text(obscureText(widget.number!, 4), style: TextStyle(fontSize: 24)),
          Gap(gap: 20),
          Text('Name'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(widget.date!),
            ],
          ),
        ],
      ),
    );
  }
}
