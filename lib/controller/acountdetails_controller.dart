import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

abstract class AccountDetailsController
    extends GetxController {
      late TextEditingController emailController;
      late TextEditingController phoneNumberController;
      late TextEditingController cityController;
      late TextEditingController cardholderNameController;
      late TextEditingController cardNumberController;
      late TextEditingController expiryDateController;
      late TextEditingController cvvController;
      late TextEditingController ccpController;

    }

class AccountDetailsControllerImp
    extends AccountDetailsController {

@override
  void onInit() {
    cardholderNameController = TextEditingController();
    cardNumberController = TextEditingController();
    expiryDateController = TextEditingController();
    cvvController = TextEditingController();
    ccpController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    cityController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    cardholderNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    ccpController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    cityController.dispose();
    
     super.dispose();
  }


    }
