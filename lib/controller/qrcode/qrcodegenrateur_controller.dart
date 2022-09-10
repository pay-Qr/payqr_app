import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/transaction/amount_controller.dart';
import 'package:payqr/controller/dashbord/dashboard_conroller.dart';

abstract class QrCodeGenerateurController
    extends GetxController {
  late String data;
  futchData();
  int amount =
      Get.find<AmountControllerImp>().val;
  var personnalData =
      Get.find<DashboardControllerImp>().user;
}

class QrCodeGenerateurControllerImp
    extends QrCodeGenerateurController {
  @override
  void onInit() {
    futchData();
    super.onInit();
  }

  @override
  futchData() {
    data = """{"name" :"${personnalData.name}",
      "ccp" : "${personnalData.ccp}",
       "time" :" ${DateTime.now().toString()}",
       "type" : "gaz",
    "amount" : $amount 
    
    
     }""";
    return data;
  }
}
