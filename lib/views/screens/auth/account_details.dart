import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/auth/acountdetails_controller.dart';
import 'package:payqr/controller/auth/phoneverfiy_controller.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/widgets/reusable_button.dart';
import 'package:payqr/views/widgets/reusable_textfield.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountDetailsControllerImp
        accountDetailsControllerImp =
        Get.put(AccountDetailsControllerImp());
    PhoneAuthControllerImp
        phoneAuthControllerImp =
        Get.put(PhoneAuthControllerImp());

    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
              color: AppColor.primary),
          title: const Text(
            "Account Details",
            style: TextStyle(
              color: Color(0xFF12182D),
              fontSize: 23,
            ),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<
            AccountDetailsControllerImp>(
          init: accountDetailsControllerImp,
          builder: (controller) {
            return controller.inprogress == true
                ? Center(
                    child:
                        CircularProgressIndicator(
                      backgroundColor: Colors.grey
                          .withOpacity(.5),
                      color: AppColor.primary,
                      semanticsLabel:
                          "Loading.....",
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets
                            .symmetric(
                        horizontal: 30,
                        vertical: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FormField(
                              builder: ((field) {
                            return Column(
                                children: [
                                  ReusableTextField(
                                    titleText:
                                        "Card Holder Name",
                                    hintText:
                                        "Enter your card name",
                                    icon: Ionicons
                                        .person_outline,
                                    controller:
                                        accountDetailsControllerImp
                                            .cardholderNameController,
                                  ),
                                  const SizedBox(
                                      height: 5),
                                  ReusableTextField(
                                    titleText:
                                        "Card Number",
                                    hintText:
                                        "Enter your card number",
                                    icon: Ionicons
                                        .wallet_outline,
                                    keyboardType:
                                        TextInputType
                                            .phone,
                                    controller:
                                        accountDetailsControllerImp
                                            .cardNumberController,
                                  ),
                                  const SizedBox(
                                      height: 5),
                                  ReusableTextField(
                                    titleText:
                                        "Expiry Date",
                                    hintText:
                                        "Enter card expiry date",
                                    icon: Ionicons
                                        .calendar_outline,
                                    keyboardType:
                                        TextInputType
                                            .phone,
                                    controller:
                                        accountDetailsControllerImp
                                            .expiryDateController,
                                  ),
                                  const SizedBox(
                                      height: 5),
                                  ReusableTextField(
                                    titleText:
                                        "CVC",
                                    hintText:
                                        "Enter your CVC",
                                    icon: Ionicons
                                        .lock_closed_outline,
                                    controller:
                                        accountDetailsControllerImp
                                            .cvvController,
                                    keyboardType:
                                        TextInputType
                                            .phone,
                                  ),
                                  const SizedBox(
                                      height: 5),
                                  ReusableTextField(
                                    titleText:
                                        "CCP Number / CLE",
                                    hintText:
                                        "123456789/12",
                                    icon: Ionicons
                                        .key_outline,
                                    controller:
                                        accountDetailsControllerImp
                                            .ccpController,
                                    keyboardType:
                                        TextInputType
                                            .phone,
                                  ),
                                ]);
                          })),
                          const SizedBox(
                              height: 20),
                          ReusableButton(
                            label: "Submit",
                            onTap: () {
                             
                              accountDetailsControllerImp
                                  .validator();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
