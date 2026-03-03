import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';



class YellowToggleButton extends StatefulWidget {
  const YellowToggleButton({super.key});

  @override
  State<YellowToggleButton> createState() => _YellowToggleButtonState();
}

class _YellowToggleButtonState extends State<YellowToggleButton> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOn = !isOn;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 30,
        width: 50,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Pallet.yellow,
            width: 3,
          ),
          color: Colors.transparent,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment:
          isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: 38,
            width: 18,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Pallet.yellow,
            ),
          ),
        ),
      ),
    );
  }
}