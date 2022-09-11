 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/views/screens/auth/login.dart';

import '../../data/datasource/static.dart';
  
 
abstract class OnBoardingController
    extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp
    extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;

  @override
  next() {
    currentPage++;
    if (currentPage > onBordingList.length - 1) {
      Get.off(Login());
    } else {
      pageController.animateToPage(currentPage,
          duration:
              const Duration(milliseconds: 400),
          curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
