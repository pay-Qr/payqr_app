
import 'package:flutter/material.dart';
import 'package:payqr/core/constants/routs.dart';

import 'views/screens/transaction/confirmpayment.dart';
  
Map<String, Widget Function(BuildContext)>
    routes = {
  
  AppRouts.confirmpayment: (context) => const ConfirmPayment(),
};