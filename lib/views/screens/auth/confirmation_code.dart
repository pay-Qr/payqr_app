import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/widgets/auth/otp.dart';

import '../../../controller/auth/phoneverfiy_controller.dart';

class ConfirmationCode extends StatelessWidget {
  const ConfirmationCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhoneAuthControllerImp
        phoneAuthControllerImp =
        Get.put(PhoneAuthControllerImp());

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Phone Number Verification",
          style: TextStyle(
            color: AppColor.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30), 
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text(
                "Please enter the 6 digit code sent to your phone number\n ${phoneAuthControllerImp.phoneController.text} ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColor.text
                        .withOpacity(.9),
                    fontSize: 17)),
            SizedBox(height: Get.height * .07),
            const OTP(),
            SizedBox(height: Get.height * .02),
            TextButton(
              onPressed: () {
                phoneAuthControllerImp
                    .verifyPhoneNumber();
              },
              child: const Text(
                "Resend Code",
                style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
