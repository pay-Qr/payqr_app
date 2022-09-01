import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/core/constants/routs.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../views/screens/confirmpayment.dart';

abstract class QrCodeScannerController
    extends GetxController {
  final GlobalKey qrKey =
      GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  Map <String, dynamic> ? data ;  
  onQRViewCreated(QRViewController controller);
}

class QrCodeScannerControllerImp
    extends QrCodeScannerController {
  @override
  onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream
        .listen((scanData) {
      barcode = scanData;
  data = json.decode(scanData.code!);
 
      update();
      
        Get.off( () =>
          const ConfirmPayment(),
          duration: const  Duration(milliseconds: 500),
          transition: Transition.downToUp,);
     
    });
  }
}
