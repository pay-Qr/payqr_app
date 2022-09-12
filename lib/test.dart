import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 import 'package:payqr/core/constants/style.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore
        .instance
        .collection('users')
        .doc("PqsbdEq5DbDSJ8iJvnh")
        .collection('transaction');

    return Scaffold(
        backgroundColor: AppColor.background,
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                users.add({
                  "amount": 2300,
                  'time': DateTime.now()
                      .add(const Duration(days: 1)),
                  "type": 'Health',
                  'receiver': {
                    'ccp': '7854158/78',
                    'name': 'ana'
                  }
                });
              },
              child: const Text("test")),
        ));
  }
}
