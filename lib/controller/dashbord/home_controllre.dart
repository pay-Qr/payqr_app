// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/dashbord/dashboard_conroller.dart';

import '../../data/models/payment_model.dart';
import '../../views/screens/transaction/recieve.dart';

abstract class HomeController
    extends GetxController {
  late bool backside = false;

  //list of filter
  List<HistoryModel> data = [];
  List<HistoryModel> monthdata = [];
  List<HistoryModel> yeardata = [];
  List<HistoryModel> weekdata = [];
  List<HistoryModel> daydata = [];
  //total amount
  late int monthtotal = 0;
  late int yeartotal = 0;
  late int weektotal = 0;
  late int daytotal = 0;
  //type total
  late int food = 0;
  late int SuperMarket = 0;
  late int Game = 0;
  late int gaz = 0;
  late int Health = 0;
  late int Electr = 0;
  late int Book = 0;
  late int cloths = 0;

  late Map<String, int>? typeTotale;

  flipcard();
  goToRecieve();
  getData();

  late bool isloading =
      Get.find<DashboardControllerImp>()
          .isloading;
  late String userId =
      Get.find<DashboardControllerImp>().userId;
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
    food = 0;
    SuperMarket = 0;
    Game = 0;
    gaz = 0;
    Health = 0;
    Electr = 0;
    Book = 0;
    cloths = 0;
    try {
      QuerySnapshot history =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(userId)
              .collection('transaction')
              .orderBy('time', descending: true)
              .get();
      for (var doc in history.docs) {
        data.add(HistoryModel(
          item: doc['type'],
          name: doc['receiver']["name"],
          ccp: doc['receiver']["ccp"],
          amount: doc['amount'],
          time: doc['time'],
        ));

        //filter data by month
        if (doc['time'].toDate().month ==
            DateTime.now().month) {
          monthdata.add(HistoryModel(
            item: doc['type'],
            name: doc['receiver']["name"],
            ccp: doc['receiver']["ccp"],
            amount: doc['amount'],
            time: doc['time'],
          ));
        }
        //filter data by year
        if (doc['time'].toDate().year ==
            DateTime.now().year) {
          yeardata.add(HistoryModel(
            item: doc['type'],
            name: doc['receiver']["name"],
            ccp: doc['receiver']["ccp"],
            amount: doc['amount'],
            time: doc['time'],
          ));
        }

        //filter data by week
        if (doc['time'].toDate().day ==
            DateTime.now().day) {
          daydata.add(HistoryModel(
            item: doc['type'],
            name: doc['receiver']["name"],
            ccp: doc['receiver']["ccp"],
            amount: doc['amount'],
            time: doc['time'],
          ));
        }
        //filter data by week
        if (doc['time'].toDate().weekday <=
                doc['time'].toDate().weekday +
                    4 ||
            doc['time'].toDate().weekday <=
                doc['time'].toDate().weekday -
                    3) {
          weekdata.add(HistoryModel(
            item: doc['type'],
            name: doc['receiver']["name"],
            ccp: doc['receiver']["ccp"],
            amount: doc['amount'],
            time: doc['time'],
          ));
        }

        switch (doc['type']) {
          case "food":
            food += doc['amount'] as int;

            break;
          case "SuperMarket":
            SuperMarket += doc['amount'] as int;
            break;
          case "Game":
            Game += doc['amount'] as int;
            break;
          case "gaz":
            gaz += doc['amount'] as int;
            break;
          case "Health":
            Health += doc['amount'] as int;
            break;
          case "Electr":
            Electr += doc['amount'] as int;
            break;
          case "Book":
            Book += doc['amount'] as int;
            break;
          case "cloths":
            cloths += doc['amount'] as int;
            break;

          default:
        }
      }
      typeTotale = {
        "SuperMarket": SuperMarket,
        "food": food,
        "Game": Game,
        "Health": Health,
        "Electr": Electr,
        "Book": Book,
        "cloths": cloths,
        "gaz": gaz,
      };
      //calculate total amount
      daytotal = daydata.fold(
          0,
          (previousValue, element) =>
              previousValue + element.amount!);
      weektotal = weekdata.fold(
          0,
          (previousValue, element) =>
              previousValue + element.amount!);
      monthtotal = monthdata.fold(
          0,
          (previousValue, element) =>
              previousValue + element.amount!);
      yeartotal = yeardata.fold(
          0,
          (previousValue, element) =>
              previousValue + element.amount!);

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
