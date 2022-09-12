import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/dashbord/home_controllre.dart';
import 'package:payqr/data/models/statices_model.dart';

import '../../views/screens/dashboard.dart';

abstract class StatisticsController
    extends GetxController {
  late TextEditingController budgetController =
      TextEditingController();
  late String type = "null";
  CollectionReference users = FirebaseFirestore
      .instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('statistics');
  late List<StaticesModel> data = [];
  late bool isLoading = false;
  HomeControllerIpm homeControllerIpm =
      Get.put(HomeControllerIpm());

  addData();
  validator();
  getData();
  getTotal(index);
}

class StatisticsControllerImp
    extends StatisticsController {
  @override
  void onInit() {
    budgetController = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    budgetController.dispose();
    super.dispose();
  }

// add data to firestore
  @override
  addData() {
    try {
      users.add({
        "amount":
            int.parse(budgetController.text),
        'title': type,
        "type": type,
      }).then((value) => Get.snackbar(
          "successful added",
          "successful added the budget",
          backgroundColor: Colors.green,
          colorText: Colors.white));

      getData();
      Get.off(() => const Dashboard());
      budgetController.clear();
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

//validate the form
  @override
  validator() {
    if (budgetController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your budget",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (type == "null") {
      Get.snackbar(
        "Error",
        "Please select type",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      addData();
    }
  }

  // get data from firestore
  @override
  getData() async {
    data.clear();

    isLoading = true;
    update();
    try {
      QuerySnapshot history = await users.get();
      for (var doc in history.docs) {
        data.add(StaticesModel(
          amount: doc['amount'],
          title: doc['title'],
          type: doc['type'],
        ));
      }
      isLoading = false;
      update();
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }
  //get type total

  @override
  getTotal(index) {
    

  }
}
