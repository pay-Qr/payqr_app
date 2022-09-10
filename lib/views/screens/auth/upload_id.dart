import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';

class UploadID extends StatefulWidget {
  const UploadID({super.key});

  @override
  State<UploadID> createState() => _UploadIDState();
}

class _UploadIDState extends State<UploadID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

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
            Image.asset("assets/images/id_card.jpeg"),

            const SizedBox(height: 80),

            // TAKE PHOTO BUTTON
            ClickAbleReusableButton(
              label: "Take Photo",
              color: AppColor.blue,
              textColor: Colors.white,
              onTap: () {},
            ),

            const SizedBox(height: 20),

            // UPLOAD PHOTO BUTTON
            ClickAbleReusableButton(
              label: "Upload from library",
              color: Colors.white,
              textColor: Colors.black,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// BUTTONS WIDGET: THI BUTTON IS BEST LEFT HERE BECAUSE THERE IS AN ALMOST SIMILAR BUTTON INSIDE THE WIDGETS FOLDER
class ClickAbleReusableButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final Color color;
  final Color textColor;

  const ClickAbleReusableButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blueText.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                  BoxShadow(
                    color: AppColor.blueText.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Amaranth",
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
