import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
  import 'package:get/get.dart';
import 'package:payqr/controller/qrcode/qrcodescanner_controller.dart';
  import '../../data/models/user_model.dart';

abstract class DashboardController
    extends GetxController {
  onItemTapped(index);
  CollectionReference users = FirebaseFirestore
      .instance
      .collection('users');

  UserInformation user = UserInformation();
  late bool backside = false;
  late String userId = FirebaseAuth.instance.currentUser!.uid;
   getUser();
  flipcard();
 }

class DashboardControllerImp
    extends DashboardController {
  late int currentPage = 0;
  late bool isloading = false;
// get user personal data from firestore
  @override
  getUser() async {
    isloading = true;
    await users
        .doc()
        .get()
        .then((value) {
      user = UserInformation(
          cardNumber: value['cardNumber'],
          name: value['cardholderName'],
          expiryDate: value['expiryDate'],
          cvv: value['cvv'],
          ccp: value['ccp'],
          email: value['email'],
          phone: value['phoneNumber'],
          city: value['city']);
    });
    isloading = false;
    update();
  }

//bottom navigation bar
  @override
  onItemTapped(index) {
    currentPage = index;

    update();
  }

// card filp fun
  @override
  flipcard() {
    if (!backside) {
      backside = true;
    } else {
      backside = false;
    }
    update();
  }


// on Init
  @override
  void onInit() {
    getUser();
        
     super.onInit();
  }
}
