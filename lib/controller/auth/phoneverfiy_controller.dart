import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/auth/acountdetails_controller.dart';
import 'package:payqr/views/screens/dashboard.dart';

import '../../views/screens/auth/confirmation_code.dart';

abstract class PhoneAuthController
    extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  late TextEditingController phoneController =
      TextEditingController();
  late String verId;
  late bool isloding = false;
  String userId = FirebaseAuth.instance.currentUser!.uid;
   var  adduser =  Get.lazyPut(() => AccountDetailsControllerImp().adduser());
  verifyPhoneNumber();
  checkcode(String code);
  valdiation();
}

class PhoneAuthControllerImp
    extends PhoneAuthController {
  @override
  void onInit() {
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();

  }

  @override
  verifyPhoneNumber() async {
    isloding = true;
    update();
    await auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted:
          (PhoneAuthCredential credential) {
        isloding = false;
        update();
        Get.snackbar(
          'Verification Completed',
          'Verification Completed',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
       adduser;
      },
      verificationFailed:
          (FirebaseAuthException e) {
        isloding = false;
        update();
        if (e.code == 'invalid-phone-number') {
          Get.snackbar(
            'Error',
            'The provided phone number is not valid.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else if (e.code ==
            'too-many-requests') {
          Get.snackbar(
            'Error',
            'Too many requests. Try again later.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
      codeSent: (String verificationId,
          int? resendToken) {
        isloding = false;
        update();
        verId = verificationId;
        Get.to(const ConfirmationCode(),
            transition: Transition.rightToLeft,
            duration:
                const Duration(milliseconds: 5),
            curve: Curves.easeIn);
      },
      timeout: const Duration(seconds: 20),
      codeAutoRetrievalTimeout:
          (String verificationId) {
        isloding = false;
        update();
      },
    );
  }

  @override
  checkcode(code) async {
    isloding = false;
    update();

    try {
      isloding = false;
      update();
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(
              verificationId: verId,
              smsCode: code);
      await auth.signInWithCredential(credential);
      Get.snackbar(
        "Success",
        'Verification Completed',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.offAll(() => const Dashboard());
    } catch (e) {
      if (e == 'invalid-verification-code') {
        Get.snackbar(
          'Error',
          'The provided verification code is not valid.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  valdiation() {
    if (phoneController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter phone number',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (phoneController.text.length < 13) {
      Get.snackbar(
        'Error',
        'Please enter valid phone number',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      verifyPhoneNumber();
    }
  }
}
