import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';

class ReusableButton extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const ReusableButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Amaranth",
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
