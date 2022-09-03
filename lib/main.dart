import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
  
import 'core/constants/style.dart';
import 'views/screens/dashboard.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
       theme: ThemeData(
        fontFamily: AppFont.primary,
        textTheme: const TextTheme(
          bodyText1: TextStyle(height: 2.3 , fontFamily: AppFont.primary),
          headline1: TextStyle(
              color: Colors.black, fontSize: 24),
        ),
        primarySwatch: Colors.blue,
      ),
      
      home:  const  Dashboard()
    );
  }
} 