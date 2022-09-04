import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/personal_details.dart';
import 'package:payqr/views/widgets/reusable_button.dart';

class ConfirmationCode extends StatefulWidget {
  const ConfirmationCode({super.key});

  @override
  State<ConfirmationCode> createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // ENTER CODE TEXT
              const Text(
                "Enter Code",
                style: TextStyle(
                  color: Color(0xFF12182D),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Amaranth",
                ),
              ),

              const SizedBox(height: 20),

              // PLEASE ENTER THE CODE TEXT
              const Text(
                "Please enter the code received by",
                style: TextStyle(
                  color: Color(0xFF12182D),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Amaranth",
                ),
              ),

              const SizedBox(height: 20),

              // DISPLAY PHONE NUMBER TEXT
              const Text(
                // Todo: Hardcoded phone number
                "+(213) 555 555 555",
                style: TextStyle(
                  color: Color(0xFF12182D),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Amaranth",
                ),
              ),

              const SizedBox(height: 40),

              // CONFIRMATION CODE CONTAINERS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  OTPContainer(),
                  OTPContainer(),
                  OTPContainer(),
                  OTPContainer(),
                  OTPContainer(),
                  OTPContainer(),
                ],
              ),

              const SizedBox(height: 40),

              // RESEND CODE TEXT
              const Text(
                "Resend Code in 00:30",
                style: TextStyle(
                  color: AppColor.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Amaranth",
                ),
              ),

              const SizedBox(height: 300),

              // CONFIRM LOGIN BUTTON
              ReusableButton(
                label: "LOGIN",
                onTap: () {
                  // Todo: Add OnTap Fumctionality
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const PersonalDetails(),
                  //   ),
                  // );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OTPContainer extends StatelessWidget {
  const OTPContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.blueAccent)),
      child: Center(
        child: TextField(
          onChanged: (value) => {
            if (value.length == 1)
              {
                FocusScope.of(context).nextFocus(),
              }
          },
          keyboardType: TextInputType.number,
           inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          maxLength: 1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF12182D),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Amaranth",
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counter: Offstage(),
          ),
        ),
      ),
    );
  }
}
