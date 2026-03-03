import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class ReceivePage extends StatelessWidget {
  const ReceivePage({super.key});

  final String textToCopy =
      "Hello, Flutter developer! Hello, Flutter developerHello, Flutter developerHello, Flutter developer";

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: textToCopy));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Pallet.secondaryBack,
              borderRadius: Borders.bottomRadius
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
                data: 'This QR code has an embedded image as well',
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
                embeddedImage: AssetImage('assets/images/Logo/Logo2.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(size: Size(60, 60)),
              ),
            ),
          ),
          Gap(gap: 40,),
          GestureDetector(
            onTap: copyToClipboard,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    textToCopy,
                    softWrap: true,
                    style: TextStyle(fontSize:16 ,color: Colors.white, overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                ),
                Icon(Icons.copy,color: Pallet.text,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
