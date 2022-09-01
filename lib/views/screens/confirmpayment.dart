import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/qrcode/qrcodescanner_controller.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    QrCodeScannerControllerImp controller =
        Get.put(QrCodeScannerControllerImp());

    return     Scaffold(
          appBar: AppBar(
            title: const Text('ConfirmPay'),
          ),
          body: Center(
            child: Wrap(
              children: <Widget>[
                Text(
                    'Barcode value: ${controller.data!["location"]["country"]}'),
              ],
            ),
          ),
        );
      
  }
}
