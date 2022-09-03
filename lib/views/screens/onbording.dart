import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/core/constants/style.dart';
 
class OnBording extends StatelessWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.large(
        
        shape: const  CircleBorder(
          side: BorderSide(color: Colors.white, width: 7)),
        
          onPressed: () {
          Get.offAllNamed('/home');
        },
        child: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/first_image.png'),
            Container(
               height: Get.height * 0.35,
               width: Get.width * 0.8,
               decoration: BoxDecoration(
                  color: AppColor.blue,
                  borderRadius: BorderRadius.circular(20),
                  
                
               ),
            ),
          ],
        ),
      )
    );
  }
}

 