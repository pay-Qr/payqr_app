import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
  import 'package:get/get.dart';
 
import '../views/screens/dashboard.dart';
 
abstract class AccountDetailsController
    extends GetxController {
  late TextEditingController emailController;
  late TextEditingController
      phoneNumberController;
  late TextEditingController cityController;
  late TextEditingController
      cardholderNameController;
  late TextEditingController cardNumberController;
  late TextEditingController expiryDateController;
  late TextEditingController cvvController;
  late TextEditingController ccpController;
  FirebaseFirestore firestore =
      FirebaseFirestore.instance;
      late bool inprogress = false;
      
        
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
    phoneNumberController =
        TextEditingController();
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

  @override
  adduser() {
    try {
     inprogress = true;
     update();
      firestore
          .collection('users')
          .doc("KlzLRTEq5DbDSJ8iJvnh")
          .collection("userinfo")
          .add({
        'email': emailController.text,
        'phoneNumber': phoneNumberController.text,
        'city': cityController.text,
        'cardholderName':
            cardholderNameController.text,
        'cardNumber': cardNumberController.text,
        'expiryDate': expiryDateController.text,
        'cvv': cvvController.text,
        'ccp': ccpController.text,
      });
      inprogress = false;
      update();
      Get.offAll(() => const Dashboard());
    } catch (e) {
      GetSnackBar(
          title: 'error', message: e.toString());
    }
  }

  @override
  validator() {
    if (emailController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        cityController.text.isEmpty ||
        cardholderNameController.text.isEmpty ||
        cardNumberController.text.isEmpty ||
        expiryDateController.text.isEmpty ||
        cvvController.text.isEmpty ||
        ccpController.text.isEmpty) {
     return   Get.snackbar(
          'Error',
          'Please fill all the fields',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
          
    } else {
      adduser();
    }
  }
}
