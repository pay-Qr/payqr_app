import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/home_controllre.dart';
import 'package:payqr/controller/qrcode/qrcodescanner_controller.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/widgets/reusable_button.dart';
import 'package:payqr/views/widgets/selecttype.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    QrCodeScannerControllerImp controller =
        Get.put(QrCodeScannerControllerImp());
    HomeControllerIpm homeControllerIpm =
        Get.put(HomeControllerIpm());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ConfirmPay',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body:
          GetBuilder<QrCodeScannerControllerImp>(
        init: controller,
        builder: (controller) => controller.isloading == true ? const  CircularProgressIndicator(
          color: AppColor.primary,
        ) :Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              const SelectType(),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "please confirm your payment",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primary,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width * .95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(.2),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Text(
                        "Amount :",
                        style: TextStyle(
                            fontWeight:
                                FontWeight.bold),
                      ),
                      title: Text(
                          "${controller.data!['amount'].toString()} DA"),
                      trailing: IconButton(
                        icon: const Icon(Ionicons
                            .cash_outline),
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      leading: const Text(
                        "Receiver :",
                        style: TextStyle(
                            fontWeight:
                                FontWeight.bold),
                      ),
                      title: Text(controller
                          .data!['name']
                          .toString()),
                      trailing: IconButton(
                        icon: const Icon(Ionicons
                            .person_outline),
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      leading: const Text(
                        "CCP :",
                        style: TextStyle(
                            fontWeight:
                                FontWeight.bold),
                      ),
                      title: Text(controller
                          .data!['ccp']
                          .toString()),
                      trailing: IconButton(
                        icon: const Icon(
                            Ionicons.key_outline),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ReusableButton(
                    label: 'Confirm',
                    onTap: () async {
                      await controller
                          .confirmPayment();

                      homeControllerIpm.getData();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
