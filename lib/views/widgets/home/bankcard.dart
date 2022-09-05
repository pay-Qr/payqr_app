import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controllre.dart';

class AppBankCard extends StatelessWidget {
  const AppBankCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    HomeControllerIpm homeControllerIpm =
        Get.put(HomeControllerIpm());
    return GetBuilder<HomeControllerIpm>(
      init: homeControllerIpm,
      builder: (controller) {
        return InkWell(
          onTap: () => controller.flipcard(),
          child: CreditCardWidget(
             onCreditCardWidgetChange: (p0) {},
            cardType: CardType.otherBrand,
            cardNumber: "1235478965476321",
            expiryDate: "15/22",
            cardHolderName: "Hassan Ali moosa",
            cvvCode: "1564",
            bankName: 'National Bank Algeria',
            showBackView: controller.backside,
            
            glassmorphismConfig: Glassmorphism(
              blurX: 1.0,
              blurY: 5.0,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.grey.withAlpha(20),
                  Colors.white.withAlpha(20),
                ],
                stops: const <double>[
                  0.3,
                  0,
                ],
              ),
            ),
            backgroundImage:
                "assets/images/visa.png",
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
           
            height: 190,
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            width: MediaQuery.of(context)
                .size
                .width,
            isChipVisible: true,
            isSwipeGestureEnabled: false,
            customCardTypeIcons: <
                CustomCardTypeIcon>[
                  
              CustomCardTypeIcon(
                cardType: CardType.otherBrand,

                cardImage: Image.asset(
                  'assets/images/bna.png',
                  
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
