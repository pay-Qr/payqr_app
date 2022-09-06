import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/personal_details.dart';
import 'package:payqr/views/widgets/reusable_button.dart';
import 'package:payqr/views/widgets/reusable_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Login",
          style: TextStyle(
            color: Color(0xFF12182D),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: [
              // QR HAND-PHONE IMAGE
              Container(
                height: Get.height * 0.35,
                width: Get.width * 0.8,
                decoration: const BoxDecoration(
                  color: AppColor.background,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/login.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: Get.height * 0.07),
              // PHONE NUMBER TEXT FIELD
              Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            AppColor.background,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color:
                            AppColor.background,
                        offset:
                            Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: const ReusableTextField(
                    titleText: "Phone Number",
                    hintText:
                        "Enter your Phone Number",
                    icon: Icons.phone,
                    keyboardType:
                        TextInputType.phone,
                  )),

              SizedBox(height: Get.height * 0.03),
              ReusableButton(
                label: "Next",
                onTap: () {},
              ),
              const SizedBox(height: 40),

              // DON'T HAVE AN ACCOUNT? AND SIGN UP PROMPT BUTTON TEXT
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: AppColor.text
                          .withOpacity(.6),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const PersonalDetails());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColor.blue,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
