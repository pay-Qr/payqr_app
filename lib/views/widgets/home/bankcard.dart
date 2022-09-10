import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/dashboard_conroller.dart';

 
class AppBankCard extends StatelessWidget {
  const AppBankCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    DashboardControllerImp
        dashboardControllerImp =
        Get.put(DashboardControllerImp());
    return GetBuilder<DashboardControllerImp>(
      init: dashboardControllerImp,
      builder: (controller) {
        return InkWell(
          onTap: () => controller.flipcard(),
          child: CreditCardWidget(
            onCreditCardWidgetChange: (p0) {},
            cardType: CardType.otherBrand,
            cardNumber: dashboardControllerImp
                .user.cardNumber ?? '',
            expiryDate: dashboardControllerImp
                .user.expiryDate ?? '',
            cardHolderName:
                dashboardControllerImp.user.name ??
                    '',
            cvvCode:
                dashboardControllerImp.user.cvv ?? '',
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
            obscureCardCvv: false,
            isHolderNameVisible: true,
            height: 190,
            width:
                MediaQuery.of(context).size.width,
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
