import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/dashboard_conroller.dart';
import 'package:payqr/data/models/payment_model.dart';

class AppHistoryPage extends StatelessWidget {
  const AppHistoryPage({Key? key})
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
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 25, right: 12, top: 10),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'History',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '35500DA',
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title:
                        Text(controller.data[index].name!),
                    subtitle: Text(
                        '${controller.data[index].time!.toDate().day}/${controller.data[index].time!.toDate().month}/${controller.data[index].time!.toDate().year}'),
                    trailing: Text(
                        '${controller.data[index].amount} DA'),
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor:
                          itemModel[controller.data[index].item]!.color,
                      child: Icon(
                        itemModel[controller.data[index].item]!.icon,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  );
                })))
      ]));
    }));
  }
}
