import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/views/screens/qrcode/qrcodegen.dart';

import '../../controller/dashboard_conroller.dart';
import '../../core/constants/style.dart';
import '../../data/datasource/static.dart';

class Dashboard
    extends GetView<DashboardController> {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    DashboardControllerImp controller =
        Get.put(DashboardControllerImp());
    return GetBuilder<DashboardControllerImp>(
        builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            children: [
              widgetOptions.elementAt(
                  controller.currentPage),
            ],
          ),
        ),
        floatingActionButton:
            FloatingActionButton(
          backgroundColor: AppColor.blue,
          child: Image.asset(
            "assets/images/qr_code.png",
            height: 38,
          ),
          onPressed: () {
            Get.to(const QrcodeGen());
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation
                .centerDocked,
        bottomNavigationBar:
            AnimatedBottomNavigationBar(
                activeIndex:
                    controller.currentPage,
                icons: bottomBarItems,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness
                    .verySmoothEdge,
                leftCornerRadius: 30,
                rightCornerRadius: 30,
                activeColor: AppColor.primary,
                onTap: (int index) {
                  controller.onItemTapped(index);
                }),
      );
    });
  }
}
