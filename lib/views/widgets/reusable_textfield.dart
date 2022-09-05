import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final String titleText;

  const ReusableTextField({
    Key? key,
    required this.hintText,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FIRST NAME TEXT
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              titleText,
              style: const TextStyle(
                color: Color(0xFF12182D),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Amaranth",
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 10.0,
        ),

        // FIRST NAME TEXT FIELD
        Container(
          decoration: const BoxDecoration(),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF7FBFF),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: "Amaranth",
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
