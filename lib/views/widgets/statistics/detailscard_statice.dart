import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:payqr/controller/dashbord/home_controllre.dart';
import 'package:payqr/controller/dashbord/statistics_controller.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/data/models/payment_model.dart';
import 'package:payqr/views/widgets/statistics/circleprogress.dart';

class AppDeatailesStaticeCard
    extends StatelessWidget {
  const AppDeatailesStaticeCard({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatisticsControllerImp
        statisticsControllerImp =
        Get.put(StatisticsControllerImp());
    HomeControllerIpm homeControllerIpm =
        Get.put(HomeControllerIpm());
    return GetBuilder<StatisticsControllerImp>(
        init: statisticsControllerImp,
        builder: ((controller) {
          return controller.isLoading
              ? const CircularProgressIndicator(
                  color: AppColor.primary,
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount:
                          controller.data.length,
                      itemBuilder:
                          (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets
                                      .symmetric(
                                  horizontal: 15,
                                  vertical: 10),
                          child: Container(
                            decoration:
                                BoxDecoration(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors
                                      .black26,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              //icon progress circle
                              leading:
                                  AppCircleProgress(
                                index: index,
                                moyenne: homeControllerIpm.typeTotale![controller
                                            .data[
                                                index]
                                            .type]!  /
                                    controller
                                        .data[
                                            index]
                                        .amount!,
                              ),
                              title: Text(
                                  "${controller.data[index].title}"),
                              subtitle: Text(
                                  "${homeControllerIpm.typeTotale![controller.data[index].type]} DA"),
                              trailing: Text(
                                  '${controller.data[index].amount}DA',
                                  style:
                                      TextStyle(
                                    color: itemModel[
                                            "${controller.data[index].type}"]!
                                        .color,
                                    fontWeight:
                                        FontWeight
                                            .w600,
                                  )),
                            ),
                          ),
                        );
                      }),
                );
        }));
  }
}
