import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/transaction/amount_controller.dart';

class AppFormFeildRecive extends StatelessWidget {
  const AppFormFeildRecive({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AmountControllerImp amountControllerImp =
        Get.put(AmountControllerImp());
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 35),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(25),
        child: TextField(
          onChanged: (f) =>
              amountControllerImp.changed(),
          controller: amountControllerImp.amount,
          style: const TextStyle(
            height: 1,
          ),
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: 20, horizontal: 25),
            suffixIcon: Icon(
              Ionicons.wallet_outline,
            ),
            hintText: 'Enter Amount',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.white),
              borderRadius: BorderRadius.all(
                  Radius.circular(20)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.white),
              borderRadius: BorderRadius.all(
                  Radius.circular(20)),
            ),
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
