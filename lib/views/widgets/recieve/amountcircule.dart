import 'package:circular/circular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/transaction/amount_controller.dart';
import 'package:payqr/core/constants/style.dart';

class AppAmountCircule extends StatelessWidget {
  const AppAmountCircule({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AmountControllerImp controller =
        Get.put(AmountControllerImp());
    return GetBuilder<AmountControllerImp>(
        init: controller,
        builder: (controller) {
          return CircularSlider(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(200),
            ),
            maxValue: 10000,  
            radius: 115,
            color: AppColor.background,
            sliderColor: AppColor.primary,
            unSelectedColor:
                Colors.grey.withOpacity(.4),
            key: key,
            onDrag: (value) {
              controller.amount.text =
                  value.toString();
              controller.changed();
            },
            child: Text(
              controller.val == "0"
                  ? "0 DA"
                  : "${controller.val} DA",
              style: const TextStyle(
                  fontSize: 20,
                 fontWeight: FontWeight.w600,

                  color: AppColor.primary),
            ),
          );
        });
  }
}
// SleekCircularSlider(
//           onChange: (value) {},
//           initialValue: amountControllerImp.val,
//           appearance: CircularSliderAppearance(
//             customWidths: CustomSliderWidths(
//               progressBarWidth: 15,
//               trackWidth: 5,
//             ),
//             size: Get.height * 0.28,
//             angleRange: 360,
//             infoProperties: InfoProperties(
//               modifier: (value) {
//                 value = value * 1 ;
//                 return value.toInt().toString();
//               },
//               mainLabelStyle: const TextStyle(
//                   color: AppColor.primary,
//                   fontSize: 30),
//               bottomLabelText: 'DA',
//               bottomLabelStyle: const TextStyle(
//                   color: AppColor.primary,
//                   fontSize: 20),
//             ),
//             customColors: CustomSliderColors(
//               progressBarColor: AppColor.primary,
//               trackColor: Colors.grey,
//               dotColor: AppColor.secondary,
//             ),  
//           ),
//         )