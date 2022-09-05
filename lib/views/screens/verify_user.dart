import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/upload_id.dart';

class VerifyUser extends StatefulWidget {
  const VerifyUser({super.key});

  @override
  State<VerifyUser> createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // BACK BUTTON AND 
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
              ],
            ),

            const SizedBox(height: 40),

            // UPLOAD ID TEXT
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(
                  child: Text(
                    "Please take a photo of HANANE NACER Passport information page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Amaranth",
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // ID CARD IMAGE
            Image.asset("assets/images/image.jpeg"),

            const SizedBox(height: 100),

            // TAKE PHOTO BUTTON
            ClickAbleReusableButton(
              label: "Verify Now",
              color: AppColor.blue,
              textColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
