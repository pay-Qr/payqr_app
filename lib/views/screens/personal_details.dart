import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/account_details.dart';
import 'package:payqr/views/widgets/reusable_button.dart';
import 'package:payqr/views/widgets/reusable_textfield.dart';

import '../../controller/acountdetails_controller.dart';

 
class PersonalDetails extends StatelessWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     AccountDetailsControllerImp accountDetailsControllerImp =
        Get.put(AccountDetailsControllerImp());
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Personal Details",
          style: TextStyle(
            color: Color(0xFF12182D),
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 30, vertical: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormField(builder: ((field) {
                return Column(children:   [
                   ReusableTextField(
                    titleText: "Full Name",
                    hintText:
                        "Enter your Full name",
                    icon: Ionicons.person_outline,
                    keyboardType: TextInputType.name,

                    controller: accountDetailsControllerImp.cardholderNameController,
                  ),

                  const SizedBox(height: 5),

                  ReusableTextField(
                    titleText: "Email",
                    hintText: "Enter your Email",
                    keyboardType: TextInputType.emailAddress,
                    icon: Ionicons.mail_outline,
                    controller: accountDetailsControllerImp.emailController,
                  ),

                  const SizedBox(height: 5),
                  ReusableTextField(
                    titleText: "Phone Number",
                    hintText:
                        "Enter your Phone Number",
                        keyboardType: TextInputType.phone,
                    icon: Ionicons.call_outline,
                    controller: accountDetailsControllerImp.phoneNumberController,
                  ),
                  const SizedBox(height: 5),

                 

                  ReusableTextField(
                    titleText: "City",
                    hintText: "Enter your City",

                    icon:
                        Ionicons.location_outline,
                    controller: accountDetailsControllerImp.cityController,
                    keyboardType: TextInputType.streetAddress,
                  ),
                ]);
              })),

              const SizedBox(height: 20),

              // NEXT BUTTON
              ReusableButton(
                label: "Next",
                onTap: () {

                  Get.to(() => const AccountDetails());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
