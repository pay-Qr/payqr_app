import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/confirmation_code.dart';
import 'package:payqr/views/widgets/reusable_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneController = TextEditingController();

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

            // LOGIN TEXT
            const Text(
              "LOGIN",
              style: TextStyle(
                color: Color(0xFF12182D),
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: "Amaranth",
              ),
            ),
            const SizedBox(height: 25),

            // QR HAND-PHONE IMAGE
            Container(
              decoration: const BoxDecoration(
                color: AppColor.background,
              ),
              child: Image.asset(
                "assets/images/login.jpeg",
              ),
            ),
            const SizedBox(height: 40),

            // PHONE NUMBER TEXT FIELD
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColor.background,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: AppColor.background,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: TextField(
                controller: _phoneController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  // Todo: Make the prefixText Transparent
                  prefixText: '+213',
                  prefixStyle: TextStyle(
                    color: Colors.transparent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter your phone number",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // NEXT BUTTON
            ReusableButton(
              label: "Next",
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ConfirmationCode(),
                //   ),
                // );
              },
            ),
            const SizedBox(height: 40),

            // DON'T HAVE AN ACCOUNT? AND SIGN UP PROMPT BUTTON TEXT
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: AppColor.blueText,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Amaranth",
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
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
