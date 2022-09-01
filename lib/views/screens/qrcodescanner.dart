import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/qrcodescanner_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatelessWidget {
  const QrCodeScanner({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    QrCodeScannerControllerImp controller =
        Get.put(QrCodeScannerControllerImp());
    return GetBuilder<QrCodeScannerControllerImp>(
      init: controller,
        builder: ((controller) {
      return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                  key: controller.qrKey,
                  onQRViewCreated:
                      controller.onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderRadius: 13,
                    borderColor: Colors.blue,
                    borderLength: 30,
                    borderWidth: 5,
                    cutOutSize:
                        MediaQuery.of(context)
                                .size
                                .width *
                            0.8,
                  )),
            ),
            Expanded(
                child: Center(
              child: Text(
                controller.barcode != null
                    ? '${controller.barcode!.code}'
                    : 'No barcode found.',
                style: const  TextStyle(
                    color: Color.fromARGB(
                        255, 0, 0, 0)),
                maxLines: 3,
              ),
            ))
          ],
        ),
      );
    }));
  }
}
