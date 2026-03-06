import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class ReceivePage extends StatelessWidget {
  ReceivePage({super.key});

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: textToCopy));
  }

  final user = FirebaseAuth.instance.currentUser!.uid;

  late final String textToCopy = user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: Pallet.back),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Pallet.secondaryBack,
          title: Text(
            'Receive',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Pallet.secondaryBack,
                borderRadius: Borders.bottomRadius,
              ),
              child: Center(
                child: Text(
                  'Scan this to receive payment',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
            Gap(gap: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Pallet.yellow, width: 10),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.black,
                ),
                child: QrImageView(
                  data: user,
                  version: QrVersions.auto,
                  size: 330,
                  gapless: false,
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.black,
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: Colors.white,
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    color: Colors.white,
                    dataModuleShape: QrDataModuleShape.square,
                  ),
                  // embeddedImage: AssetImage('assets/images/Logo/Logo2.png'),
                  // embeddedImageStyle: QrEmbeddedImageStyle(size: Size(60, 60)),
                ),
              ),
            ),
            Gap(gap: 40),
            GestureDetector(
              onTap: copyToClipboard,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      textToCopy,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Icon(Icons.copy, color: Pallet.text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
