import 'package:flutter/material.dart';

class AppHomeBtn extends StatelessWidget {
  final String label;
  final void Function() ontap;
  final IconData icon;
  const AppHomeBtn(
      {Key? key,
      required this.label,
      required this.icon,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 17, vertical: 10),
      child: InkWell(
        onTap: ontap,
        child: Column(
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(15)),
              child: Icon(
                icon,
                size: 27,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
