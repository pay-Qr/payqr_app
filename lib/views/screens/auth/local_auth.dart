import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:payqr/controller/localauth_controller.dart';
   

 class LocalAuthBio extends GetView <LocaleAuthControllerImp> {
   const LocalAuthBio({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
    LocaleAuthControllerImp localeAuthControllerImp = LocaleAuthControllerImp();
        return const Scaffold(
      body: Center(  
      ),
    );
   }
 }