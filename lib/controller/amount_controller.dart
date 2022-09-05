import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import '../views/screens/qrcode/qrcodegen.dart';

abstract class AmountController
    extends GetxController {
  String val = "0";
  changed();
  submit();
}

class AmountControllerImp
    extends AmountController {
  late TextEditingController amount;

  @override
  void onInit() {
    amount = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  @override
  changed() {
    val = amount.text;

    update();
  }

  @override
  submit() {
    if (val == "0") {
      Get.snackbar("Error", "Amount can't be 0",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else {
      Get.to( const QrcodeGen(),
          curve: Curves.easeInOut,
          transition:
              Transition.rightToLeftWithFade,
          duration:
              const Duration(milliseconds: 500));
    }
  }
}
