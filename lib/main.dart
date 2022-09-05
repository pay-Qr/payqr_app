import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/views/screens/account_details.dart';
import 'package:payqr/views/screens/confirmation_code.dart';
import 'package:payqr/views/screens/identity_verification.dart';
import 'package:payqr/views/screens/login.dart';
import 'package:payqr/views/screens/onbording.dart';
import 'package:payqr/views/screens/personal_details.dart';
 
  
import 'core/constants/style.dart';
import 'views/screens/dashboard.dart';
import 'views/screens/upload_id.dart';
import 'views/screens/verify_user.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PayQR App',
       theme: ThemeData(
        fontFamily: AppFont.primary,
        textTheme: const TextTheme(
          bodyText1: TextStyle(height: 2.3 , fontFamily: AppFont.primary),
          headline1: TextStyle(
              color: Colors.black, fontSize: 24),
        ),
        primarySwatch: Colors.blue,
      ),
      
      home: const IdentityVerification(),
    );
  }
} 