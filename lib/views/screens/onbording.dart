import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/login.dart';

class OnBording extends StatelessWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset('assets/images/first_image.png'),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: Get.height * 0.35,
                    width: Get.width * 0.8,
                    decoration: BoxDecoration(
                      color: AppColor.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Make Payment Easier',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF12182D),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Amaranth",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Best payment method, connect your money to your brand and experience',
                            style: TextStyle(
                              color: Color(0xFF394B8F),
                              fontSize: 20,
                              fontFamily: "TitanOne",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: 125,
                    child: GestureDetector(
                      onTap: () {
                        // Todo: ADD NAVIGATION TO NEXT SCREEN;
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const Login(),
                        //   ),
                        // );
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.background,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.arrow_forward,
                            color: AppColor.text, size: 40),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
