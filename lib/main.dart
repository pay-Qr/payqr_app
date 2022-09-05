import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/localauth_controller.dart';
import 'package:payqr/views/screens/auth/local_auth.dart';
import 'package:payqr/views/screens/dashboard/home.dart';
import 'package:payqr/views/screens/onbording.dart';

import 'core/constants/style.dart';
import 'views/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleAuthControllerImp
        localeAuthControllerImp =
        LocaleAuthControllerImp();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: AppFont.primary,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              height: 2.3,
              fontFamily: AppFont.primary),
          headline1: TextStyle(
              color: Colors.black, fontSize: 24),
        ),
        primarySwatch: Colors.blue,
      ),
      home: GetBuilder<LocaleAuthControllerImp>(
        init: localeAuthControllerImp,
        builder: (controller)   {
          if (controller.isAuth)  {
            return const Dashboard();
          } else  {
             controller.authenticat();

            if (controller.isAuth) {
              return const Dashboard();
            } else {
              return const Dashboard();
            }
          }
        },
      ),
    );
  }
}
