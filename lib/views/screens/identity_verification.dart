import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/widgets/reusable_identity_verification_button.dart';

class IdentityVerification
    extends StatelessWidget {
  const IdentityVerification({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Identity Verification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: const [
                Flexible(
                  child: Text(
                    "Please Select One Of The Following Methods To Verify Your Identity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 19,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // PASSPORT BUTTON
            ReusableIdentitiyVerificationButton(
              titleText: "Passport",
              subtitleText:
                  "Scan passport to \n verify your identity",
              iconImagePath:
                  "assets/images/icon/passport.png",
              onTap: () {},
            ),

            const SizedBox(height: 40),

            // NATIONAL CARD
            ReusableIdentitiyVerificationButton(
              titleText: "National Card",
              subtitleText:
                  "Scan card to \n verify your identity",
              iconImagePath:
                  "assets/images/icon/id-card.png",
              onTap: () {},
            ),

            // USER INFORMATION GUARANTEE TEXT
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.end,
                children: const [
                  Flexible(
                    child: Text(
                      "We guarantee your information security, Your information is only used for identity verification!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
