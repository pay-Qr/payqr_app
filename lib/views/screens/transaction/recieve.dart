import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/amount_controller.dart';

import '../../../core/constants/style.dart';
import '../../widgets/recieve/amountcircule.dart';
import '../../widgets/recieve/formfieldrecive.dart';

class Recieve extends StatelessWidget {
  const Recieve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  AmountControllerImp amountControllerImp = Get.put(AmountControllerImp());
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Recieve',
          style: TextStyle(
              color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_back_circle_outline,
            size: 35,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.08,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: const [
                Text(
                    'How Much You Are\n Going To Recieve?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 23)),
              ],
            ),
            const AppFormFeildRecive(),
            const AppAmountCircule(),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
               amountControllerImp.submit();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(
                        vertical: 12),
                height: 50,
                width: Get.width * 0.65,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius:
                        BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColor.primary,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: const Text(
                  'Recieve Money',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight:
                          FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    ) ;
  }
}