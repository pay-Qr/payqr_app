import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:phone_authentication_app/screens/home.dart';
import 'package:pinput/pinput.dart';

import '../utils/error_dialog.dart';

class OTP extends StatefulWidget {
  const OTP({
    super.key,
    required this.verificationId,
    required this.isTimeOut2,
    required this.fullName,
    required this.phoneNumber,
  });

  final String verificationId;
  final bool isTimeOut2;
  final String fullName;
  final String phoneNumber;

  @override
  State<OTP> createState() => _OTP();
}

class _OTP extends State<OTP> {
  final TextEditingController otpController = TextEditingController();
  final int pinLength = 6;

  String errorMessage = '';

  final FirebaseAuth auth = FirebaseAuth.instance;

  // FOR RESEND OTP BUTTON
  String userVerificationId = '';
  bool isTimeOut = false;

  @override
  void initState() {
    super.initState();
    isTimeOut = widget.isTimeOut2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Confirm Code",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Hello',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' ${widget.fullName}'.toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                            fontSize: 20)),
                    const TextSpan(
                      text: ' Enter the OTP Code sent to',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                        text: ' ${widget.phoneNumber}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                            fontSize: 20)),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Pinput(
                length: pinLength,
                controller: otpController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                defaultPinTheme: PinTheme(
                  width: 60.0,
                  height: 50.0,
                  textStyle: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.greenAccent,
                      width: 2.0,
                    ),
                  ),
                ),

                errorText: errorMessage,
                errorTextStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                errorPinTheme: PinTheme(
                  width: 70.0,
                  height: 70.0,
                  textStyle: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.redAccent,
                      width: 2.0,
                    ),
                  ),
                ),

                onTap: () {
                  otpController.clear();
                },

                // onCompleted:
                onCompleted: (value) async {
                  try {
                    // CREATE A PHONE AUTH CREDENTIAL WITH THE CODE ENTERED BY THE USER
                    //AND THE VERIFICATION ID FROM THE PREVIOUS STEP
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: otpController.text);

                    // SIGN IN THE USER WITH THE CREDENTIAL
                    await auth.signInWithCredential(credential);
                  } on FirebaseAuthException catch (e) {
                    errorDialog(context: context, exception: e);
                  }

                  // IF THE USER IS SIGNED IN, THEN NAVIGATE TO THE HOME SCREEN
                  if (auth.currentUser != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  } else {
                    setState(() {
                      errorMessage = 'Invalid OTP';
                    });
                  }
                },
              ),
              SizedBox(height: Get.height * 0.05),
              Text(
                "Didn't receive the code?",
                style: TextStyle(
                  color: Colors.blueGrey.shade700,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: isTimeOut
                    ? () {}
                    : () async {
                        setState(() {
                          isTimeOut = false;
                        });

                        // RESEND OTP
                        FirebaseAuth auth = FirebaseAuth.instance;

                        // VERIFY PHONE NUMBER METHOD
                        await auth.verifyPhoneNumber(
                          // PHONE NUMBER TO SEND OTP
                          phoneNumber: widget.phoneNumber,

                          // WHEN VERIFICATION IS COMPLETED
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},

                          // WHEN VERIFICATION IS FAILED
                          verificationFailed: (FirebaseAuthException e) {
                            errorDialog(
                              context: context,
                              exception: e,
                            );
                          },

                          // WHEN CODE IS SENT
                          codeSent: (String verificationId, int? resendToken) {
                            // SET THE VERIFICATION ID
                            setState(() {
                              verificationId = widget.verificationId;
                            });
                          },

                          // WHEN CODE IS TIMEOUT
                          timeout: const Duration(seconds: 10),

                          // WHEN CODE AUTO RETRIEVAL IS TIMEOUT
                          codeAutoRetrievalTimeout: (String verificationId) {
                            setState(() {
                              isTimeOut = true;
                            });
                          },
                        );
                      },
                child: const Text(
                  "Resend Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
