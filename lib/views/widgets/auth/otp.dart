import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../core/constants/style.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    const borderColor =
        AppColor.primary;
    const color =
       AppColor.secondary;
    late Color fillColor =
       AppColor.secondary.withOpacity(.2);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: Colors.transparent),
      ),
    );
    return SizedBox(
                height: 68,
                child: Pinput(
                  length: 6,
                  defaultPinTheme:
                      defaultPinTheme,
                  focusedPinTheme:
                      defaultPinTheme.copyWith(
                    height: 68,
                    width: 64,
                    decoration: defaultPinTheme
                        .decoration!
                        .copyWith(
                      border: Border.all(
                          color: borderColor),
                    ),
                  ),
                  errorPinTheme:
                      defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          BorderRadius.circular(
                              8),
                    ),
                  ),
                ),
              );
  }
}