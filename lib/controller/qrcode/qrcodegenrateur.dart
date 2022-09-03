import 'package:get/get.dart';
 abstract class QrCodeGenerateurController extends GetxController {
  final String data = '{"first_name" : "fname","last_name" : "lname","gender" : "male", "location" : { "state" : "algeria", "country" : "country", "place" : "place"} }';

}

class QrCodeGenerateurControllerImp extends QrCodeGenerateurController {
 
}
   