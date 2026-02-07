import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';

void showSheet(BuildContext context , IconData icon, String heading, String message, VoidCallback onTap) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        height: 350,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 44),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff433123),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                height: 286,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Gap(gap: 50),
                        Text(
                          heading,
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                        Gap(gap: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          child: Text(
                            message,
                            style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            radius: 20,
                            colors: [Color(0xff3a2815), Colors.white],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          border: Border.all(color: Colors.white30)
                        ),
                        child: ElevatedButton(
                            onPressed: onTap,
                            style: ElevatedButton.styleFrom(
                              surfaceTintColor: Colors.white,
                              backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                minimumSize: Size(double.infinity, 60),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)),)
                            ),
                            child: Text('Done',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18),)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 15,
              child: SizedBox(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Pallet.yellow,
                  foregroundColor: Colors.black,
                  shape: CircleBorder(),
                  elevation: 20,
                  child: Icon(icon, size: 45),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}