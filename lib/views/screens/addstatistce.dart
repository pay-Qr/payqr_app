import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/dashbord/statistics_controller.dart';
import 'package:payqr/views/widgets/reusable_button.dart';
import 'package:payqr/views/widgets/reusable_textfield.dart';
import 'package:payqr/views/widgets/selecttypestatic.dart';

import '../../core/constants/style.dart';

class AddStatistic extends StatelessWidget {
  const AddStatistic({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatisticsControllerImp
        statisticsControllerImp =
        Get.put(StatisticsControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        title: const Text(
          'Statistics',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Ionicons.chevron_back_outline,
            size: 30,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SelectTypeStaic(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: Get.height * 0.02),
                child:   ReusableTextField(
                  hintText: "Enter your Budget",
                  titleText: '',
                  controller: statisticsControllerImp.budgetController,
                  icon: Ionicons.cash_outline,
                  keyboardType:
                      TextInputType.phone,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.all(8.0),
                child: ReusableButton(
                    label: "Create",
                    onTap: () {
                      statisticsControllerImp
                          .validator();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
