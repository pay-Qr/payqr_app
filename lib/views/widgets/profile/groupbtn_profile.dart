import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/views/widgets/profile/btn_profile.dart';

class AppGroupBtnProfile extends StatelessWidget {
  const AppGroupBtnProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                            children: [
                              AppBtnProfile(
                                  icon: Ionicons
                                      .finger_print_outline,
                                  title: 'Security',
                                  color: Colors
                                      .white,
                                  iconColor:
                                      Colors
                                          .grey,
                                  onTap: () {
                                    
                                  }),
                              const SizedBox(
                                width: 40,
                              ),
                              AppBtnProfile(
                                  icon: Ionicons
                                      .settings_outline,
                                  title: 'Settings',
                                  color: Colors
                                      .white,
                                  iconColor:
                                      Colors
                                          .grey,
                                  onTap: () {
                                    
                                  }),
                             
                              const SizedBox(
                                width: 40,
                              ),
                              AppBtnProfile(
                                  icon: Ionicons
                                      .power_outline,
                                  title:
                                      'PowerOff',
                                  color: Colors
                                      .redAccent,
                                  iconColor:
                                      Colors
                                          .white,
                                  onTap: () {
                                    exit(0);
                                  }),
                            ],
                          );
  }
}