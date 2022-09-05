import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/qrcode/qrcodegenrateur_controller.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/dashboard.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrcodeGen extends StatelessWidget {
  
  const QrcodeGen(
      {Key? key,  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    QrCodeGenerateurControllerImp controller =
        Get.put(QrCodeGenerateurControllerImp());
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Scan QR Code',
          style: TextStyle(
              color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_back_circle_outline,
            size: 35,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: Get.height * .55,
              width: Get.width * .8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primary
                        .withOpacity(.2),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: PrettyQr(
                  size: 200,
                  image: const AssetImage(
                      'assets/images/bna.png'),
                  data:  controller.data ,
                  errorCorrectLevel:
                      QrErrorCorrectLevel.H,
                  roundEdges: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () {
              Get.to(
              const   Dashboard(),
                transition: Transition.rightToLeft,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(
                    milliseconds: 500),
              
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 12),
              height: 50,
              width: Get.width * 0.65,
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius:
                      BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.primary,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: const Text(
                'Go To Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
