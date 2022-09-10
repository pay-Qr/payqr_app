import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/dashboard_conroller.dart';
 import 'package:payqr/controller/pageview_controller.dart';
import 'package:payqr/data/models/payment_model.dart';
import 'package:payqr/views/widgets/history/historywidget.dart';

import '../../../controller/dashbord/home_controllre.dart';
import '../../../core/constants/style.dart';
import '../../../data/datasource/data.dart';
import '../../widgets/history/hisorybar.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageViewControllerImp pageViewControllerImp =
        Get.put(PageViewControllerImp());
    HomeControllerIpm homeControllerIpm = Get.put(HomeControllerIpm());
   
    return Scaffold(
        backgroundColor: AppColor.background,
        body: GetBuilder<HomeControllerIpm>(
          init: homeControllerIpm,
          builder: 
        (controller) {
          return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              const Text('History',
                  style: TextStyle(fontSize: 28)),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                   TextButton(
                    onPressed: () {
                      pageViewControllerImp
                          .next(0);
                    },
                    child: const Text(
                      "Week\t\t\t\t\t\t\t",
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 16,
                      ),
                    ),
                  ) ,

                  TextButton(
                    onPressed: () {
                      pageViewControllerImp
                          .next(1);
                    },
                    child: Text(
                      "Month\t\t\t\t\t\t\t",
                      style: TextStyle(
                        color: AppColor.text
                            .withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                  ),
                                    TextButton(
                    onPressed: () {
                      pageViewControllerImp
                          .next(2);
                    },
                    child:   Text(
                      "Year ",
                      style: TextStyle(
                        color: AppColor.text
                            .withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                  ),
                 
                ],
              ),
              controller.data.isEmpty
                  ? Expanded(
                      child: Center(
                          child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: const [
                          Icon(Ionicons
                              .cloud_offline_outline),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              'No History Available')
                        ],
                      )),
                    )
                  : Expanded(
                    child: PageView(
                   
                     
                      controller:
                          pageViewControllerImp
                              .controller,
                      children: [
                         // week
                          AppHistoryPage(
                              data: controller.weekdata ,
                              total: controller.weektotal,
                              title: 'Week',
                            
                          ) ,
                      
                        // month
                        Column(
                          children: [
                            SizedBox(
                              height:
                                  Get.height *
                                      0.32,
                              child: ListView
                                  .builder(
                                scrollDirection:
                                    Axis.horizontal,
                                itemCount:
                                    4,
                                itemBuilder:
                                    (context,
                                        index) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.end,
                                    children: [
                                      AppHistoryBar(
                                        month: monthes[index].month,
                                        amount: monthes[index].amount,
                                        color: monthes[index].color,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height:
                                  Get.height *
                                      0.06,
                            ),
                              AppHistoryPage(
                                 data: controller.monthdata ,
                              total: controller.monthtotal,
                              title: 'Month',
                              )
                          ],
                        ),
                          // year
                        Column(
                          children: [
                            SizedBox(
                              height:
                                  Get.height *
                                      0.32,
                              child: ListView
                                  .builder(
                                scrollDirection:
                                    Axis.horizontal,
                                itemCount:
                                    12,
                                itemBuilder:
                                    (context,
                                        index) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.end,
                                    children: [
                                      AppHistoryBar(
                                        month: year[index].month,
                                        amount: year[index].amount,
                                        color: year[index].color,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height:
                                  Get.height *
                                      0.06,
                            ),
                        AppHistoryPage(
                              data: controller.yeardata ,
                              total: controller.yeartotal,
                              title: 'Year',
                            )
                          ],
                        ),
                       
                      ], 
                    ),
                  )
            ],
          ),
        );
        },));
  }
}
