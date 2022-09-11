import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/dashbord/dashboard_conroller.dart';
 import '../../../controller/dashbord/home_controllre.dart';
import '../../../core/constants/style.dart';

class AppHomeBar extends StatelessWidget {
  final void Function()? ontap;
  const AppHomeBar({Key? key, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
        HomeControllerIpm homeControllerIpm = Get.put(HomeControllerIpm());
        DashboardControllerImp dashboardControllerImp = Get.put(DashboardControllerImp());

     return Padding(
      padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
          bottom: 20),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(
                    "assets/images/profile_image.jpg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Hay There ",
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
          InkWell(
            onTap: (() {
              dashboardControllerImp.getUser();
        
            }),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius:
                      BorderRadius.circular(25)),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
