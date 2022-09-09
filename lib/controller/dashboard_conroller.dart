import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  List<HistoryModel> data = [];
  late int total = 0;
  getUser();
  flipcard();
  getData();
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

// get user transaction data from firestore
  @override
  getData() async {
    data.clear();

    try {
      QuerySnapshot history =
          await FirebaseFirestore.instance
              .collection("users")
              .doc("PqsbdEq5DbDSJ8iJvnh")
              .collection('transaction')
              .get();
      for (var doc in history.docs) {
        data.add(HistoryModel(
          item: doc['type'],
          name: doc['receiver']["name"],
          ccp: doc['receiver']["ccp"],
          amount: doc['amount'],
          time: doc['time'],
        ));
        total += doc['amount'] as int;
        update();
      }
      ;
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

// on Init
  @override
  void onInit() {
    getUser();
 getData() ;
    super.onInit();
  }
}
