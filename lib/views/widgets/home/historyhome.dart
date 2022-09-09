import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/dashboard_conroller.dart';
import 'package:payqr/data/models/payment_model.dart';

class AppHistoryHome extends StatelessWidget {
  const AppHistoryHome({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardControllerImp
        dashboardControllerImp =
        Get.put(DashboardControllerImp());
    return GetBuilder<DashboardControllerImp>(
      init: dashboardControllerImp,
        builder: ((controller) {
      return Expanded(
          child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30))),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
            child: controller.data.isEmpty
                ? Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: const [
                      Icon(Ionicons
                          .cloud_offline_outline),
                      SizedBox(
                        width: 10,
                      ),
                      Text('No History Available')
                    ],
                  )
                : Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children:  [
                   const   Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 22),
                      ),
                      Text(
                        '${controller.total} DA',
                        style:const TextStyle(
                            fontSize: 22),
                      )
                    ],
                  ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount:
                      controller.data.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(controller
                          .data[index].name!),
                      subtitle: Text(
                          '${controller.data[index].time!.toDate().hour}:${controller.data[index].time!.toDate().minute}'),
                      trailing: Text(
                          '${controller.data[index].amount} DA'),
                      leading: CircleAvatar(
                        backgroundColor:
                            itemModel[controller
                                    .data[index]
                                 .item]!
                                .color,
                        child: Icon(
                          itemModel[controller
                                  .data[index]
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
