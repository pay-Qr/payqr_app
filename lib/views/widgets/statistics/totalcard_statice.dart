import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:payqr/controller/dashbord/home_controllre.dart';
import 'package:payqr/views/screens/addstatistce.dart';

import '../../../core/constants/style.dart';

class AppStaticCard extends StatelessWidget {
  const AppStaticCard({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerIpm homeControllerIpm =
        Get.put(HomeControllerIpm());

    return // TOTAL BALANCE
        Positioned(
      top: Get.height * .06,
      left: Get.width * .05,
      child: Container(
        height: Get.height * .15,
        width: Get.width * .9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 25),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<HomeControllerIpm>(
                init: homeControllerIpm,
                builder: (controller) {
                  return Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          color: Color.fromARGB(255, 104, 104, 104),
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '20,000 DA',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                          "-${homeControllerIpm.monthtotal.toString()} DA",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 17,
                            fontWeight:
                                FontWeight.bold,
                          )),
                    ],
                  );
                },
              ),

              // ADD BUTTON ICON
              InkWell(
                onTap: () {
                  Get.to(const AddStatistic(),
                      duration: const Duration(
                          milliseconds: 500),
                      transition:
                          Transition.rightToLeft,
                      curve: Curves.easeIn);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColor.primary,
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.add_sharp,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
