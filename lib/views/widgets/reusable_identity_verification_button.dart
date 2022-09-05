import 'package:flutter/material.dart';

class ReusableIdentitiyVerificationButton extends StatelessWidget {
  final String iconImagePath;
  final String titleText;
  final String subtitleText;
  final Function() onTap;

  const ReusableIdentitiyVerificationButton({
    Key? key,
    required this.iconImagePath,
    required this.titleText,
    required this.subtitleText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.grey.shade50,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // ICON
                SizedBox(
                  height: 50,
                  child: Image.asset(iconImagePath),
                ),

                const SizedBox(width: 20),

                // TITLE AND SUBTITLE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      style: TextStyle(
                        color: Color(0xFF12182D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Amaranth",
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitleText,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontFamily: "Amaranth",
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // ARROW ICON
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
