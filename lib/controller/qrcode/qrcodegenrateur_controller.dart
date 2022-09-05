import 'package:get/get.dart';
import 'package:payqr/controller/amount_controller.dart';

abstract class QrCodeGenerateurController
    extends GetxController {
 late String   data;
  futchData( );
  String amount = Get.find<AmountControllerImp>().val;
}

class QrCodeGenerateurControllerImp
    extends QrCodeGenerateurController {
      @override
  void onInit() {
    futchData();
    super.onInit();
  }
      @override
      futchData( ) {
       data =
      """{"first_name" : "fname",
      "last_name" : "lname",
    "amount" : "$amount"
    
    
     }""";
    return data;
      }
    }
