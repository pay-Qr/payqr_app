import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/account_details.dart';
import 'package:payqr/views/widgets/reusable_button.dart';
import 'package:payqr/views/widgets/reusable_textfield.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // ICON IMAGE AND TEXT
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.person,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                const Text(
                  "Personal Details",
                  style: TextStyle(
                    color: Color(0xFF12182D),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Amaranth",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // FIRST NAME TEXT FIELD
            const ReusableTextField(
              titleText: "First Name",
              hintText: "Enter your first name",
            ),

            const SizedBox(height: 20),

            // LAST NAME TEXT FIELD
            const ReusableTextField(
              titleText: "Last Name",
              hintText: "Enter your last name",
            ),

            const SizedBox(height: 20),

            // EMAIL TEXT FIELD
            const ReusableTextField(
              titleText: "Email",
              hintText: "Enter your email",
            ),

            const SizedBox(height: 20),

            // CITY TEXT FIELD
            const ReusableTextField(
              titleText: "City",
              hintText: "Enter your city",
            ),

            const SizedBox(height: 80),

            // NEXT BUTTON
            ReusableButton(
              label: "Next",
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const AccountDetails(),
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
