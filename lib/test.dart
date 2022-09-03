import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:payqr/data/datasource/data.dart';
import 'package:payqr/views/widgets/hisorybar.dart';

import 'core/constants/style.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Column(
          mainAxisAlignment:
              MainAxisAlignment.end,
          children: [
            Container(
              height: Get.height * 0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppHistoryBar(
                        month: BarData[index].month,
                        amount: BarData[index].amount,
                      
                        color: BarData[index].color,
                      ),
                    ],
                  );
                },
              ),
            ) ,
            Expanded(flex: 2, child: Container()),
          ],
        ));
  }
}
