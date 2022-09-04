import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/dashboard.dart';
import 'package:payqr/views/widgets/reusable_button.dart';
import 'package:payqr/views/widgets/reusable_textfield.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // ICON IMAGE AND TEXT
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.credit_card,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                const Text(
                  "Account Details",
                  style: TextStyle(
                    color: Color(0xFF12182D),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Amaranth",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // CARD HOLDER TEXT FIELD
            const ReusableTextField(
              titleText: "Card Holder Name",
              hintText: "Enter your card name",
            ),

            const SizedBox(height: 20),

            // CARD NUMBER TEXT FIELD
            const ReusableTextField(
              titleText: "Card Number",
              hintText: "Enter your card number",
            ),

            const SizedBox(height: 20),

            // EXPIRY DATE TEXT FIELD
            const ReusableTextField(
              titleText: "Expiry Date",
              hintText: "Enter card expiry date",
            ),

            const SizedBox(height: 20),

            // CITY TEXT FIELD
            const ReusableTextField(
              titleText: "CVC",
              hintText: "Enter your CVC", // CVC = Card Verification Code
            ),

            const SizedBox(height: 20),

            // CITY TEXT FIELD
            const ReusableTextField(
              titleText: "CCP Number / CLE",
              hintText: "Enter your city",
            ),

            const SizedBox(height: 30),

            // NEXT BUTTON
            ReusableButton(
              label: "SUBMIT",
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Dashboard(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
