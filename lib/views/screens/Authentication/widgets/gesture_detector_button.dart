import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GestureDetectorButton extends StatefulWidget {
  const GestureDetectorButton({super.key, required this.onTap,});

   final Function() onTap;

  @override
  State<GestureDetectorButton> createState() => _GestureDetectorButtonState();
}

class _GestureDetectorButtonState extends State<GestureDetectorButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: Get.height * 0.07,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "Get OTP Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
