import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 20,
      ),
      child: Row(
        children: [
          // ICON
          Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),

          SizedBox(
            width: Get.width * 0.05,
          ),

          // TITLE
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}
