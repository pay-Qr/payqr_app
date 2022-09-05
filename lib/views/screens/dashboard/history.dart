import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/views/widgets/history/historywidget.dart';
 
import '../../../core/constants/style.dart';
import '../../../data/datasource/data.dart';
import '../../widgets/history/hisorybar.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
           
            children: [
             const  Text('History', style: TextStyle(fontSize: 28)),
           const  SizedBox(height: 5),
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
              SizedBox(
                height: Get.height * 0.32,
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
                            barData[index].month,
                          amount:
                              barData[index].amount,
                          color:
                              barData[index].color,
                        ),
                      ],
                    );
                  },
                ),
              ),
             const SizedBox(
                height: 30,
              ),
             
            const AppHistoryPage()
            ],
          ),
        ));
  }
}
