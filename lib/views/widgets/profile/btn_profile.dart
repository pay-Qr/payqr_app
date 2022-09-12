import 'package:flutter/material.dart';
 
class AppBtnProfile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final Color iconColor;
  final void Function() onTap;
  const AppBtnProfile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.color,
      required this.iconColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: color,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 3)
                ],
                borderRadius:
                    const BorderRadius.all(
                        Radius.circular(5))),
            child: Icon(
             icon,
              color: iconColor,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
