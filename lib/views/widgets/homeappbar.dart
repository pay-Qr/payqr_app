import 'package:flutter/material.dart';

import '../../core/constants/style.dart';

class AppHomeBar extends StatelessWidget {
  const AppHomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
          bottom: 20),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(
                    "assets/images/profile_image.jpg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Hay Theer ",
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius:
                    BorderRadius.circular(25)),
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
