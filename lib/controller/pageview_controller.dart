import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payqr/core/constants/style.dart';

abstract class PageViewController
    extends GetxController {
  late PageController controller =
      PageController();
  late Color color = AppColor.text;
  next(page);
}

class PageViewControllerImp
    extends PageViewController {
  @override
  void onInit() {
    controller = PageController(
      initialPage: 0,
      keepPage: true,
    );
    super.onInit();
  }
  
  @override
 next(page) {
  
    controller.animateToPage(page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn);
       
  }
}
