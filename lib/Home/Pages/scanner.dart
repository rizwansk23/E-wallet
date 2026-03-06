import 'package:e_wallet/Home/Pages/transfer_page.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  // 1. Controller banayein
  final MobileScannerController controller = MobileScannerController(
    detectionSpeed:
        DetectionSpeed.noDuplicates, // Ek code baar-baar scan nahi hoga
    facing: CameraFacing.back,
    torchEnabled: false,
  );

  @override
  void dispose() {
    // 2. Memory leak aur camera freeze se bachne ke liye dispose karein
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: MobileScanner(
        key: UniqueKey(),
        controller: controller, // Controller pass karein
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            print('Found: ${barcode.rawValue}');

            // Scanner ko stop karein scan hone ke baad (Optional)
            if (barcode.rawValue != null) {
              controller.stop();
              Navigator.pop(context);
              Navigator.push(context, myRoute(TransferPage(receiver_Uid: barcode.rawValue!,)));
            }

            // Yahan navigate karein ya data dikhayein
          }
        },
      ),
    );
  }
}
