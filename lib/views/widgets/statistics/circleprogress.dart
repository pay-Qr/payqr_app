import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:payqr/controller/dashbord/statistics_controller.dart';

import '../../../data/models/payment_model.dart';

class AppCircleProgress extends StatelessWidget {
  final int index;
  final double moyenne;
  const AppCircleProgress(
      {Key? key, required this.index, required this.moyenne})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatisticsControllerImp
        statisticsControllerImp =
        Get.put(StatisticsControllerImp());
    late String type = statisticsControllerImp.data[index].type!;    
    return SizedBox(
      height: 50,
      width: 50,
      child: LiquidCircularProgressIndicator(
        value:moyenne,
        valueColor: AlwaysStoppedAnimation(
          itemModel[
                   type]!
              .color,
        ),
        backgroundColor: Colors.white,
        borderColor: itemModel[
              type]!
            .color,
        borderWidth: 1.0,
        direction: Axis.vertical,
        center: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.transparent,
          child: Icon(
            itemModel[
                type]!
                .icon,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
