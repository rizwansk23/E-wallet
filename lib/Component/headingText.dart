import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  final String text;
  const H1({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 33,color: Pallet.heading),);
  }
}

class AuthText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AuthText({super.key,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(text,style: TextStyle(color: Pallet.yellow))
    );
  }
}

class Gap extends StatelessWidget {
  final double gap;
  const Gap({super.key,required this.gap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: gap,);
  }
}

