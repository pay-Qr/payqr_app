import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/qrcode/qrcodescanner_controller.dart';
import '../../core/constants/style.dart';
import '../../data/models/payment_model.dart';

class SelectType extends StatelessWidget {
  const SelectType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QrCodeScannerControllerImp controller =
        Get.put(QrCodeScannerControllerImp());
    return Column(
      children: [
        const Text(
          "Select Type",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColor.primary,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (() {
                controller.type = "SuperMarket";
              }),
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    itemModel["SuperMarket"]!
                        .color,
                child: Icon(
                  itemModel["SuperMarket"]!.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (() {
                controller.type = "food";
              }),
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    itemModel["food"]!.color,
                child: Icon(
                  itemModel["food"]!.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (() {
                controller.type = 'Game';
              }),
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    itemModel["Game"]!.color,
                child: Icon(
                  itemModel["Game"]!.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (() {
                controller.type = "Health";
              }),
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    itemModel["Health"]!.color,
                child: Icon(
                  itemModel["Health"]!.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (() {
                controller.type = "Electr";
              
              }),
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    itemModel["Electr"]!.color,
                child: Icon(
                  itemModel["Electr"]!.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (() {
                controller.type = "cloths";
              
              }),
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    itemModel["cloths"]!.color,
                child: Icon(
                  itemModel["cloths"]!.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (() {
                controller.type = "Book";
              
              
              }),
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    itemModel["Book"]!.color,
                child: Icon(
                  itemModel["Book"]!.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (() {
                controller.type = "gaz";
              
              
              }),
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    itemModel["gaz"]!.color,
                child: Icon(
                  itemModel["gaz"]!.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
