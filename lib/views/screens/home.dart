import 'package:flutter/material.dart';
 import 'package:ionicons/ionicons.dart';
 
import '../../core/constants/style.dart';
import '../widgets/bankcard.dart';
import '../widgets/historyhome.dart';
import '../widgets/homeappbar.dart';
import '../widgets/homebtn.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Column(
          children: [
            const AppHomeBar(),
            const AppBankCard(),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                AppHomeBtn(
                    label: 'Recieve',
                    icon: Ionicons
                        .arrow_down_circle_outline,
                    ontap: () {}),
                AppHomeBtn(
                    label: 'Sent',
                    icon: Ionicons
                        .arrow_up_circle_outline,
                    ontap: () {}),
                AppHomeBtn(
                    label: 'Exchange',
                    icon: Ionicons.repeat,
                    ontap: () {})
              ],
            ),
           const  AppHistoryHome()
          ],
        ));
  }
}
