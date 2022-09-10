import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';

class ReusableCard extends StatelessWidget {
  final String imagePath;
  final String activityTitle;
  final String activityAmountLeft;
  final String activityBudget;

  const ReusableCard({
    Key? key,
    required this.imagePath,
    required this.activityTitle,
    required this.activityAmountLeft,
    required this.activityBudget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF757FD8).withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
            const BoxShadow(
              color: Colors.white,
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, -3),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // ICON
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ImageIcon(
                    AssetImage(imagePath),
                  ),
                ),

                const SizedBox(
                  width: 15,
                ),

                // ACTIVITY TYPE
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activityTitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // ACTIVITY AMOUNT LEFT
                      Text(
                        activityAmountLeft,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // PRICE
                Text(
                  activityBudget,
                  style: const TextStyle(
                    color: AppColor.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
