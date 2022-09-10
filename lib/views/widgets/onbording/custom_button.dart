 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/views/screens/auth/login.dart';

import '../../../controller/auth/onbording_controller.dart';
import '../../../core/constants/style.dart'; 

class CustomButtonOnbording
    extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnbording({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 290,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius:
                  BorderRadius.circular(15),
            ),
            margin:
                const EdgeInsets.only(top: 10),
            child: MaterialButton(
              onPressed: () {
                controller.next();
              },
              height: 50,
              child: const Text(
              "Continue",
                style:   TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 10),
            child: MaterialButton(
              onPressed: () {
                Get.off(const Login());
              },
              child: const Text(
                "Skip",
                style:   TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
