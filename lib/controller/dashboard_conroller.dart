import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../data/models/user_model.dart';

abstract class DashboardController
    extends GetxController {
  onItemTapped(index);
     CollectionReference users = FirebaseFirestore
      .instance
      .collection('users');
  User  user = User();
 getData();
}

class DashboardControllerImp
    extends DashboardController {
  late int currentPage = 0;
 

  @override
  getData() async {
    await users
        .doc("PqsbdEq5DbDSJ8iJvnh")
        .get()
        .then((value) {
         
      user = User(
          cardNumber: value['cardNumber'],
          name: value['cardholderName'],
          expiryDate: value['expiryDate'],
          cvv: value['cvv'],
          ccp: value['ccp'],
          email: value['email'],
          phone: value['phoneNumber'],
          city: value['city']);
    });
    
  }

 @override
  void onInit()   {
    
     getData();
      super.onInit();
  }

  

   
  @override
  onItemTapped(index) {
    currentPage = index;

    update();
  }
}
