import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
 import 'package:payqr/controller/localauth_controller.dart';
 

 class LocalAuthBio extends StatelessWidget {
   const LocalAuthBio({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {

    LocaleAuthControllerImp controller =  Get.put(LocaleAuthControllerImp());
      return const Scaffold(
      body: Center(  
      ),
    );
   }
 }