import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/qrcode/qrcodescanner_controller.dart';
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Ionicons
                      .arrow_back_circle_outline,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: const Text(
                "Qr Code Scanner",
                style: TextStyle(
                  color: Color(0xFF12182D),
                  fontSize: 23,
                ),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: Get.width * 0.8,
                    height: Get.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(
                              10),
                    ),
                    child: QRView(
                        key: controller.qrKey,
                        onQRViewCreated:
                            controller
                                .onQRViewCreated,
                        overlay:
                            QrScannerOverlayShape(
                                borderRadius: 13,
                                borderColor:
                                    Colors.blue,
                                borderLength: 30,
                                borderWidth: 5,
                                cutOutSize:
                                    Get.width *
                                        .7)),
                  ),
                  Text(
                    controller.barcode != null
                        ? '${controller.barcode!.code}'
                        : 'No barcode found.',
                    style: const TextStyle(
                        color: Color.fromARGB(
                            255, 0, 0, 0)),
                    maxLines: 3,
                  )
                ],
              ),
            ),
          );
        }));
  }
}
