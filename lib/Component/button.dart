import 'package:e_wallet/Component/showSheet.dart';
import 'package:e_wallet/Home/home.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Button({super.key,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Pallet.yellow,
                  minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)),)
              ),
              onPressed: onTap
                  // (){showSheet(context);}
              ,
              child: Text(text,textAlign: TextAlign.center,style: TextStyle(color: Pallet.black,fontSize: 18),)
          )
      );
  }
}
