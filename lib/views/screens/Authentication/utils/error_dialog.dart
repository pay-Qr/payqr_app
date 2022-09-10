import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

dynamic errorDialog({
  required BuildContext context,
  required FirebaseAuthException exception,
  String title = 'Verification Failed',
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title,
            style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
        content: Text(exception.message!,
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal, width: 5),
              ),
              child: const Center(
                  child: Text('Try Again',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      );
    },
  );
}
