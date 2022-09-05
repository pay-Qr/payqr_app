import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/screens/transaction/recieve.dart';
 
abstract class HomeController
    extends GetxController {
  late bool backside = false;

  flipcard();
  goToRecieve();
}

class HomeControllerIpm extends HomeController {
  @override
  flipcard() {
   if (!backside) {
      backside = true;
    } else {
      backside = false;
    }
    update();
     
   }
   
     @override
     goToRecieve() {
     Get.to( const Recieve(),
          curve: Curves.easeInOut,
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 300));
     }
 
}
