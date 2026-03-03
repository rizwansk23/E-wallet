import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key,required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Pallet.yellow,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
