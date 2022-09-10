import 'package:flutter/material.dart';
import 'package:payqr/core/constants/style.dart';

class ReusableIdentitiyVerificationButton
    extends StatelessWidget {
  final String iconImagePath;
  final String titleText;
  final String subtitleText;
  final Function() onTap;

  const ReusableIdentitiyVerificationButton({
    Key? key,
    required this.iconImagePath,
    required this.titleText,
    required this.subtitleText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: AppColor.primary,
            width: .2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color:
                  AppColor.blue.withOpacity(.3),
              blurRadius: 3,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // ICON
                SizedBox(
                  height:50,
                  child:
                      Image.asset(iconImagePath),
                ),

                const SizedBox(width: 20),

                // TITLE AND SUBTITLE
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      style: const TextStyle(
                        color: Color(0xFF12182D),
                       
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitleText,
                      style: TextStyle(
                        color: Colors.grey[600],
                        
                      ),
                    ),
                  ],
                ),
              ],
            ),

             
          const  Padding(
              padding:  EdgeInsets.all(8.0),
              child:   Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
