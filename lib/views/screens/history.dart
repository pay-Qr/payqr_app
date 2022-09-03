import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/style.dart';
import '../../data/datasource/data.dart';
import '../widgets/hisorybar.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
           
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
               const   Text(
                    "Month\t\t\t\t\t\t\t",
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Week\t\t\t\t\t\t\t",
                    style: TextStyle(
                      color: AppColor.text.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Day",
                    style: TextStyle(
                      color: AppColor.text.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                height: Get.height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment:
                          MainAxisAlignment.end,
                      children: [
                        AppHistoryBar(
                          month:
                              BarData[index].month,
                          amount:
                              BarData[index].amount,
                          color:
                              BarData[index].color,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ));
  }
}
