 
 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/screens/auth/identity_verification.dart';
import 'package:payqr/views/screens/auth/login.dart';
import 'package:payqr/views/widgets/profile/groupbtn_profile.dart';
import 'package:payqr/views/widgets/profile/headre_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Column(
          children: [
            const AppHeadreProfile(),
            Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor
                              .background,
                          borderRadius:
                              BorderRadius.only(
                                  topLeft: Radius
                                      .circular(
                                          30),
                                  topRight: Radius
                                      .circular(
                                          30))),
                      child: Padding(
                        padding: const EdgeInsets
                            .symmetric(
                          vertical: 35,
                        ),
                        child: Column(
                          children: [
                            const AppGroupBtnProfile(),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors
                                  .grey.shade300,
                              thickness: 2.5,
                            ),
                            const ListTile(
                              title: Text(
                                  "My Transiction"),
                              trailing: Icon(Ionicons
                                  .repeat_outline),
                            ),
                            Divider(
                              color: Colors
                                  .blueGrey[100],
                              thickness: .5,
                            ),
                            const ListTile(
                              title: Text(
                                  "Insurances offers"),
                              trailing: Icon(Ionicons
                                  .business_outline),
                            ),
                            Divider(
                              color: Colors
                                  .blueGrey[100],
                              thickness: .5,
                            ),
                            ListTile(
                              onTap: () {
                                Get.to(
                                    const IdentityVerification());
                              },
                              title: const Text(
                                  "Verify your account"),
                              trailing: const Icon(Ionicons
                                  .checkmark_circle_outline),
                            ),
                            Divider(
                              color: Colors
                                  .blueGrey[100],
                              thickness: .5,
                            ),
                            const ListTile(
                              title:
                                  Text("Support"),
                              trailing: Icon(Ionicons
                                  .help_circle_outline),
                            ),
                            Divider(
                              color: Colors
                                  .grey.shade300,
                              thickness: 2.5,
                            ),
                            ListTile(
                              onTap: () {
                                FirebaseAuth
                                    .instance
                                    .signOut();
                                Get.off(
                                    const Login());
                              },
                              title: const Text(
                                "Sign out",
                                style: TextStyle(
                                    color: Colors
                                        .red),
                              ),
                              trailing: const Icon(
                                  Ionicons
                                      .log_out_outline,
                                  color:
                                      Colors.red),
                            )
                          ],
                        ),
                      )),
                ))
          ],
        ));
 
  }
}
