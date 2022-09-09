import 'package:flutter/material.dart';
import 'package:get/get.dart';
  import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/home_controllre.dart';
import 'package:payqr/views/screens/qrcode/qrcodescanner.dart';
 
import '../../../core/constants/style.dart';
import '../../widgets/home/bankcard.dart';
import '../../widgets/home/historyhome.dart';
import '../../widgets/home/homeappbar.dart';
import '../../widgets/home/homebtn.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerIpm homeControllerIpm = HomeControllerIpm();
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
                    ontap: () {
                      homeControllerIpm.goToRecieve();
                    }),
                AppHomeBtn(
                    label: 'Sent',
                    icon: Ionicons
                        .arrow_up_circle_outline,
                    ontap: () {
                      Get.to(const QrCodeScanner());
                    }),
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
