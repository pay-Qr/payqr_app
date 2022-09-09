import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ReusableTextInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const ReusableTextInputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: Get.height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                labelText,
                style: const TextStyle(
                    color: Colors.white, fontSize: 15, height: 1.5),
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(),
          child: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            inputFormatters: const <TextInputFormatter>[
              // FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.teal,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              suffixIcon: Icon(icon, color: Colors.white),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                    width: 3,
                  )),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
