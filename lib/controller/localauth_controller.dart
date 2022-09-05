import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:payqr/views/screens/dashboard/home.dart';
import '../views/screens/onbording.dart';

abstract class LocaleAuthController
    extends GetxController {
  LocalAuthentication auth =
      LocalAuthentication();
  late bool isAuth = false;
  bool? canscan;
  chekbio();
  authenticat();
}

class LocaleAuthControllerImp
    extends LocaleAuthController {
  @override
  authenticat() async {
    bool authenticated = false;
    authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
            sensitiveTransaction: true));
    if (authenticated) {
      isAuth = true;
      update();
     
    }
  }

  @override
  chekbio() async {
    canscan = await auth.canCheckBiometrics;
    authenticat();
  }

  @override
  void onReady() {
    chekbio();

    super.onReady();
  }
}
