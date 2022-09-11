import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/views/screens/dashboard.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../views/screens/transaction/confirmpayment.dart';

abstract class QrCodeScannerController
    extends GetxController {
  final GlobalKey qrKey =
      GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  Map<String, dynamic>? data;
   String userId  = FirebaseAuth.instance.currentUser!.uid;


  onQRViewCreated(QRViewController controller);
  confirmPayment();
  late String type = 'null';
  
  late bool isloading = false;
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

      Get.to(
        () => const ConfirmPayment(),
        duration:
            const Duration(milliseconds: 500),
        transition: Transition.downToUp,
      );
    });
  }

  @override
  confirmPayment() {
    CollectionReference users = FirebaseFirestore
      .instance
      .collection('users')
      .doc(userId)
      .collection('transaction');
    isloading = true;
    update();
    if (type == 'null') {
      Get.snackbar(
        "Error",
        "Please select type",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      try {
        users.add({
          "amount": data!['amount'],
          'time': DateTime.now(),
          "type": type,
          'receiver': {
            'ccp': "${data!['ccp']}",
            'name': " ${data!['name']}"
          }
        }).then((value) => Get.snackbar(
            "successful transaction",
            "your transaction has been registered",
            backgroundColor: Colors.green,
            colorText: Colors.white));
        isloading = false;
        update();
        Get.off(() => const Dashboard());
      } catch (e) {
        Get.snackbar(
          "Error",
          e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
