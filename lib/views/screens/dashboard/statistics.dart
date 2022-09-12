import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/widgets/statistics/detailscard_statice.dart';
 import 'package:payqr/views/widgets/statistics/totalcard_statice.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() =>
      _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        title: const Text(
          'Statistics',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
       
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: Get.height * 0.15,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular(40),
                    bottomRight:
                        Radius.circular(40),
                  ),
                ),
 
              ),
              const AppStaticCard(),
            ],
          ),
          SizedBox(
            height: Get.height * 0.09,
          ),
        const  AppDeatailesStaticeCard(),
        ],
      ),
    );
  }
}
