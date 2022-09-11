import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final String titleText;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const ReusableTextField({
    Key? key,
    required this.hintText,
    required this.titleText,
    this.icon,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FIRST NAME TEXT
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: [
              Text(
                titleText,
                style: const TextStyle(
                    color: AppColor.text,
                    fontSize: 13,
                    height: 1.5),
              ),
            ],
          ),
        ),

        // FIRST NAME TEXT FIELD
        Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(20),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF7FBFF),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
              ),
              suffixIcon: Icon(icon),
              enabledBorder:
                  const OutlineInputBorder(
                borderSide: BorderSide(
                    width: .25,
                    color: AppColor.primary),
                borderRadius: BorderRadius.all(
                    Radius.circular(20)),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
