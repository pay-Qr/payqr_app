 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/localauth_controller.dart'; 
import 'package:payqr/views/screens/auth/login.dart';
 
import 'core/constants/style.dart';
 
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
      home:GetBuilder<LocaleAuthControllerImp>(
        init: localeAuthControllerImp,
        builder: (controller)   {
          if (controller.isAuth)  {
            return const Login();
          } else  {
              return  const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );

          
          }
        },
      ),
    );
  }
}

 