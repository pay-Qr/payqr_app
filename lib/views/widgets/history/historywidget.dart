import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
 import 'package:payqr/data/models/payment_model.dart';

import '../../../controller/dashbord/home_controllre.dart';

class AppHistoryPage extends StatelessWidget {
  final List<HistoryModel> data;
  final int total;
  final String title;
  const AppHistoryPage({
    Key? key,
    required this.data,
    required this.total,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerIpm homeControllerIpm =
        Get.put(HomeControllerIpm());
    return GetBuilder<HomeControllerIpm>(
        init: homeControllerIpm,
        builder: ((controller) {
          return Expanded(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 12, top: 10),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                   Text(
                    'History of $title',
                    style:
                        const TextStyle(fontSize: 22),
                  ),
                  Text(
                    '$total DA',
                    style: const TextStyle(
                        fontSize: 22),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder:
                        ((context, index) {
                      return ListTile(
                        title: Text(
                            data[index].name!),
                        subtitle: Text(
                           Jiffy(
                            controller
                                .data[index]
                                .time!.toDate(), 
                          ).format('dd/MM/yyyy')),
                        trailing: Text(
                            '${data[index].amount} DA'),
                        leading: CircleAvatar(
                          maxRadius: 25,
                          backgroundColor:
                              itemModel[
                                      data[index]
                                          .item]!
                                  .color,
                          child: Icon(
                            itemModel[data[index]
                                    .item]!
                                .icon,
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
