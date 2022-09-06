import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/pageview_controller.dart';
import 'package:payqr/core/constants/style.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageViewControllerImp pageViewControllerImp =
        Get.put(PageViewControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  print(value);
                },
                controller: pageViewControllerImp
                    .controller,
                children: [
                  Container(
                    color: Colors.pink,
                  ),
                  Container(
                    color: Colors.cyan,
                  ),
                  Container(
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  
                 
                },
                child: const Text("test")),
          ],
        ));
  }
}
