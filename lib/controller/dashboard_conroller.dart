import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/home_controllre.dart';
import 'package:payqr/data/models/payment_model.dart';
import '../data/models/user_model.dart';

abstract class DashboardController
    extends GetxController {
  onItemTapped(index);
  CollectionReference users = FirebaseFirestore
      .instance
      .collection('users');

  User user = User();
  late bool backside = false;

   var getdata = Get.lazyPut(() => HomeControllerIpm());

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
