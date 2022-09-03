import 'package:get/state_manager.dart';

abstract class HomeController
    extends GetxController {
  late bool backside = false;

  flipcard();
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
 
}
