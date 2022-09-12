import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/views/screens/dashboard/history.dart';
import 'package:payqr/views/screens/dashboard/home.dart';
import 'package:payqr/views/screens/dashboard/profile.dart';
import 'package:payqr/views/screens/dashboard/statistics.dart';

import '../../core/constants/imageassets.dart';
import '../models/onbordingmodel.dart';

List<IconData> bottomBarItems = const [
  Ionicons.home,
  Ionicons.time,
  Ionicons.bar_chart,
  Ionicons.person,
];
List<OnbordingModel> onBordingList = [
  OnbordingModel(
      title: 'Receive money',
      description: 'Generate you QR code, let the sender scan it and here you got your money!',
      imageUrl: AppImageUrl.onbordingone),
  OnbordingModel(
      title: 'History',
      description: 'All your money transactions will be saved in a daily, weekly or monthly history that you can check at anytime',
      imageUrl: AppImageUrl.onbordingtwo),
  OnbordingModel(
      title: 'Send money',
      description: " Tap to scan the receiver's QR code and send the money quickly and safely" ,
      imageUrl: AppImageUrl.onbordingthree),
  
];
List<Widget> widgetOptions = <Widget>[
  const Home(),
  const History(),
  const Statistics(),
  const Profile(),
];
