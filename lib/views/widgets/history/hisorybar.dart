import 'package:flutter/material.dart';

class AppHistoryBar extends StatelessWidget {
  final String? month;
  final double? amount;

  final Color? color;
  const AppHistoryBar(
      {Key? key,
      this.month,
      this.amount,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(
              left: 15, right: 15),
          width: 55,
          height: 50,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Text(
                  '$amount Da',
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight:
                          FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
              left: 15, right: 15),
          width: 55,
          height: (amount! * 100) / 1400,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.7),
            borderRadius:
                BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.end,
              children: [
                Text(
                  month!,
                  style: const  TextStyle(
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
