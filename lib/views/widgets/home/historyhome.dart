import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
 import 'package:payqr/data/models/payment_model.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/dashbord/home_controllre.dart';

class AppHistoryHome extends StatelessWidget {
  const AppHistoryHome({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerIpm homeControllerIpm =
        Get.put(HomeControllerIpm());
    return GetBuilder<HomeControllerIpm>(
        init: homeControllerIpm,
        builder: ((controller) {
          return Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft:
                        Radius.circular(30))),
            child: Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10),
                child: controller.daydata.isEmpty
                    ? Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: const [
                          Icon(Ionicons
                              .cloud_offline_outline),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              'No History Available')
                        ],
                      )
                    : Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          const Text(
                            'Today',
                            style: TextStyle(
                                fontSize: 22),
                          ),
                          Text(
                            '${controller.daytotal} DA',
                            style:
                                const TextStyle(
                                    fontSize: 22),
                          )
                        ],
                      ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: controller
                          .daydata.length,
                      itemBuilder:
                          ((context, index) {
                        return ListTile(
                          title: Text(controller
                              .daydata[index]
                              .name!),
                          subtitle: Text(Jiffy(
                            controller
                                .daydata[index]
                                .time!.toDate(), 
                          ).format('hh:mm a')),
                          trailing: Text(
                              '${controller.daydata[index].amount} DA'),
                          leading: CircleAvatar(
                            backgroundColor:
                                itemModel[controller
                                        .daydata[
                                            index]
                                        .item]!
                                    .color,
                            child: Icon(
                              itemModel[controller
                                      .daydata[
                                          index]
                                      .item]!
                                  .icon,
                              color: Colors.white,
                            ),
                          ),
                        );
                      })))
            ]),
          ));
        }));
  }
}
