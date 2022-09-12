import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/auth/phoneverfiy_controller.dart';

import '../../views/screens/dashboard.dart';

abstract class AccountDetailsController
    extends GetxController {
  late TextEditingController emailController;
  late TextEditingController cityController;
  late TextEditingController
      cardholderNameController;
  late TextEditingController cardNumberController;
  late TextEditingController expiryDateController;
  late TextEditingController cvvController;
  late TextEditingController ccpController;
  late TextEditingController phone =
      Get.find<PhoneAuthControllerImp>()
          .phoneController;
  FirebaseFirestore firestore =
      FirebaseFirestore.instance;
  bool inprogress = false;
  PhoneAuthControllerImp phoneAuthControllerImp =
      Get.put(PhoneAuthControllerImp());

  adduser();
  validator();
}

class AccountDetailsControllerImp
    extends AccountDetailsController {
  @override
  void onInit() {
    cardholderNameController =
        TextEditingController();
    cardNumberController =
        TextEditingController();
    expiryDateController =
        TextEditingController();
    cvvController = TextEditingController();
    ccpController = TextEditingController();
    emailController = TextEditingController();

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

    cityController.dispose();

    super.dispose();
  }

  @override
  adduser() {
    try {
      firestore
          .collection('users')
          .doc(FirebaseAuth
              .instance.currentUser!.uid)
          .set({
        'email': emailController.text,
        'phoneNumber': phone.text,
        'city': cityController.text,
        'cardholderName':
            cardholderNameController.text,
        'cardNumber': cardNumberController.text,
        'expiryDate': expiryDateController.text,
        'cvv': cvvController.text,
        'ccp': ccpController.text,
      });
      Get.off(() => const Dashboard());
      inprogress = false;
      update();
    } catch (e) {
      GetSnackBar(
          title: 'error', message: e.toString());
    }
  }

  @override
  validator() {
    inprogress = true;
    phoneAuthControllerImp.login = false;
    print(phoneAuthControllerImp.login);

    update();
    if (emailController.text.isEmpty ||
        phone.text.isEmpty ||
        cityController.text.isEmpty ||
        cardholderNameController.text.isEmpty ||
        cardNumberController.text.isEmpty ||
        expiryDateController.text.isEmpty ||
        cvvController.text.isEmpty ||
        ccpController.text.isEmpty) {
      inprogress = false;

      update();
      return Get.snackbar(
          'Error', 'Please fill all the fields',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else {
      phoneAuthControllerImp.verifyPhoneNumber();
    }
  }
}
