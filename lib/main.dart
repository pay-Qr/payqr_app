import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/auth/localauth_controller.dart';
import 'package:payqr/firebase_options.dart';
import 'package:payqr/views/screens/dashboard.dart';
import 'package:payqr/views/screens/onbording.dart';

import 'core/constants/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics
      .instance.recordFlutterFatalError;
  FirebasePerformance performance =
      FirebasePerformance.instance;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleAuthControllerImp
        localeAuthControllerImp =
        Get.put(LocaleAuthControllerImp());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PayQr',
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
      home: FirebaseAuth.instance.currentUser ==
              null
          ? const Onbording()
          : GetBuilder<LocaleAuthControllerImp>(
              init: localeAuthControllerImp,
              builder: (controller)   {
                  
                if (controller.isAuth ||
                    controller.canscan == false) {
                  return const Dashboard();
                } else {
                  return const Scaffold(
                    body: Center(
                        child:
                            CircularProgressIndicator()),
                  );
                }
              },
            ),
    );
  }
}
