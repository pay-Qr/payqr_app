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
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
