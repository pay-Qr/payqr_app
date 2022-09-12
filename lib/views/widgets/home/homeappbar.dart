import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/controller/dashbord/dashboard_conroller.dart';
import '../../../core/constants/style.dart';

class AppHomeBar extends StatelessWidget {
  final void Function()? ontap;
  const AppHomeBar({Key? key, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardControllerImp
        dashboardControllerImp =
        Get.put(DashboardControllerImp());

    return Padding(
      padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
          bottom: 20),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  "https://scontent.faae2-1.fna.fbcdn.net/v/t39.30808-6/267311074_1356422944800174_3068603554883209441_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHN2HbAwjJ_-ew_P5sp4IXFlSI1E3ouEmWVIjUTei4SZcOe869IAH6-Wr6Ah7hOU8rGLx-qTcFOi0m-ucj0OB6K&_nc_ohc=KE-Oe8O_GEEAX88chm-&_nc_ht=scontent.faae2-1.fna&oh=00_AT_plvkQxDjY8ZMgjfpVKlbg6iCm4BfFQUrtGJD3AGyhJA&oe=63241A67",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Hay There ",
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
          InkWell(
            onTap: (() {
              dashboardControllerImp.getUser();
            }),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius:
                      BorderRadius.circular(25)),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
