import 'package:get/get.dart';
import 'package:payqr/controller/qrcodescanner_controller.dart';

abstract class ConfirmPaymentController
    extends GetxController {
   QrCodeScannerControllerImp controller = Get.put(QrCodeScannerControllerImp());
  // final List data = controller.barcode!.code!.split("|");
}

class ConfirmPaymentControllerImp
    extends ConfirmPaymentController {
   
}