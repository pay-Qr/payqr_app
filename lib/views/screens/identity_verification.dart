import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/widgets/reusable_identity_verification_button.dart';

class IdentityVerification extends StatefulWidget {
  const IdentityVerification({super.key});

  @override
  State<IdentityVerification> createState() => _IdentityVerificationState();
}

class _IdentityVerificationState extends State<IdentityVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // BACK BUTTON AND IDENTITY VERIFICATION TEXT
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.pop(context);
                  },

                  // BACK BUTTON
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.black,
                        width: 5,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 30),

                // IDENTITY VERIFICATION TEXT
                const Text(
                  "Identity Verification",
                  style: TextStyle(
                    color: Color(0xFF12182D),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Amaranth",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // SELECT INDENTIFICATION VERIFICATION METHOD TEXT
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(
                  child: Text(
                    "Please Select One Of The Following Methods To Verify Your Identity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Amaranth",
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80),

            // PASSPORT BUTTON
            ReusableIdentitiyVerificationButton(
              titleText: "Passport",
              subtitleText: "Scan passport to \n verify your identity",
              iconImagePath: "assets/images/icon/passport.png",
              onTap: () {},
            ),

            const SizedBox(height: 40),

            // NATIONAL CARD
            ReusableIdentitiyVerificationButton(
              titleText: "National Card",
              subtitleText: "Scan card to \n verify your identity",
              iconImagePath: "assets/images/icon/id-card.png",
              onTap: () {},
            ),

            const SizedBox(height: 150),

            // USER INFORMATION GUARANTEE TEXT
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(
                  child: Text(
                    "We guarantee your information security, Your information is only used for identity verification!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Amaranth",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
