 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/dashbord/dashboard_conroller.dart';
 
import '../../data/models/payment_model.dart';
import '../../views/screens/transaction/recieve.dart';

abstract class HomeController
    extends GetxController {
  late bool backside = false;
  List<HistoryModel> data = [];
  List <HistoryModel> monthdata = [];
  List <HistoryModel> yeardata = [];
  List <HistoryModel> weekdata = [];
  List <HistoryModel> daydata = [];
   late int monthtotal = 0;
  late int yeartotal = 0;
  late int weektotal = 0;
  late int daytotal = 0;
  flipcard();
  goToRecieve();
    getData();
    late bool isloading = Get.find<DashboardControllerImp>().isloading;

 
}

class HomeControllerIpm extends HomeController {
  @override
  flipcard() {
    if (!backside) {
      backside = true;
    } else {
      backside = false;
    }
    update();
  }

  @override
  goToRecieve() {
    Get.to(const Recieve(),
        curve: Curves.easeInOut,
        transition:
            Transition.rightToLeftWithFade,
        duration:
            const Duration(milliseconds: 300));
  }
 // get user transaction data from firestore
  @override
  getData() async {
    data.clear();
    monthdata.clear();
    yeardata.clear();
    weekdata.clear();
    daydata.clear();
    

    try {
      QuerySnapshot history =
          await FirebaseFirestore.instance
              .collection("users")
              .doc("PqsbdEq5DbDSJ8iJvnh")
              .collection('transaction').orderBy('time',descending: true)
              .get();
      for (var doc in history.docs) {
        data.add(HistoryModel(
          item: doc['type'],
          name: doc['receiver']["name"],
          ccp: doc['receiver']["ccp"],
          amount: doc['amount'],
          time: doc['time'] ,
         

        ));
         if (doc['time'].toDate().month == DateTime.now().month) {
          monthdata.add(HistoryModel(
            item: doc['type'],
            name: doc['receiver']["name"],
            ccp: doc['receiver']["ccp"],
            amount: doc['amount'],
            time: doc['time'],
           
          )); 

      }
      if (doc['time'].toDate().year == DateTime.now().year) {
          yeardata.add(HistoryModel(
            item: doc['type'],
            name: doc['receiver']["name"],
            ccp: doc['receiver']["ccp"],
            amount: doc['amount'],
            time: doc['time'],
           
          )); 

      }
      if (doc['time'].toDate().day == DateTime.now().day) {
          daydata.add(HistoryModel(
            item: doc['type'],
            name: doc['receiver']["name"],
            ccp: doc['receiver']["ccp"],
            amount: doc['amount'],
            time: doc['time'] ,
             
          )); 

      }
      if (doc['time'].toDate().weekday == DateTime.now().weekday) {
          weekdata.add(HistoryModel(
            item: doc['type'],
            name: doc['receiver']["name"],
            ccp: doc['receiver']["ccp"],
            amount: doc['amount'],
            time: doc['time'],
            
          )); 

      }
      
       
      }
      daytotal = daydata.fold(0, (previousValue, element) => previousValue + element.amount!);
      weektotal = weekdata.fold(0, (previousValue, element) => previousValue + element.amount!);
      monthtotal = monthdata.fold(0, (previousValue, element) => previousValue + element.amount!);
      yeartotal = yeardata.fold(0, (previousValue, element) => previousValue + element.amount!);
      update();
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }
@override
  void onInit() {
   getData();
    super.onInit();
  }
}
