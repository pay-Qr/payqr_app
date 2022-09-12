import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/widgets/statistics/reusable_card.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: Get.height * 0.25,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF757FD8),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 20,
                  child: Row(
                    children: [
                      // BACK BUTTON
                      GestureDetector(
                        onTap: () {
                          // Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF757FD8),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.black,
                              width: 4,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: Get.width * 0.14,
                      ),

                      // TITLE
                      const Text(
                        'Statistics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // TOTAL BALANCE
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    height: Get.height * 0.13,
                    width: Get.width * 0.75,
                    margin: const EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF757FD8).withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$20,000',
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text("-\$200.8 today",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),

                          // ADD BUTTON ICON
                          GestureDetector(
                            onTap: () {
                              // Get.toNamed(Routes.ADD_MONEY);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: Get.height * 0.09,
            ),

            // AFTER STACK
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const ReusableCard(
                    imagePath: 'assets/images/bus.png',
                    activityTitle: "Auto & Transport",
                    activityAmountLeft: "\$1000 left",
                    activityBudget: "\$2000",
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  const ReusableCard(
                    imagePath: 'assets/images/bus.png',
                    activityTitle: "Food",
                    activityAmountLeft: "\$1000 left",
                    activityBudget: "\$3000",
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  const ReusableCard(
                    imagePath: 'assets/images/bus.png',
                    activityTitle: "Sports",
                    activityAmountLeft: "\$70 left",
                    activityBudget: "\$200",
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  const ReusableCard(
                    imagePath: 'assets/images/bus.png',
                    activityTitle: "Education",
                    activityAmountLeft: "\$300 left",
                    activityBudget: "\$500",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
