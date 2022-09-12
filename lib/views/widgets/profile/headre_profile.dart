import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/controller/dashbord/dashboard_conroller.dart';

class AppHeadreProfile extends StatelessWidget {
  const AppHeadreProfile({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardControllerImp
        dashboardControllerImp =
        Get.put(DashboardControllerImp());
    return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 35, horizontal: 22),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                const CircleAvatar(
                  radius: 27,
                  backgroundImage: NetworkImage(
                      "https://scontent.faae2-1.fna.fbcdn.net/v/t39.30808-6/267311074_1356422944800174_3068603554883209441_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHN2HbAwjJ_-ew_P5sp4IXFlSI1E3ouEmWVIjUTei4SZcOe869IAH6-Wr6Ah7hOU8rGLx-qTcFOi0m-ucj0OB6K&_nc_ohc=KE-Oe8O_GEEAX88chm-&_nc_ht=scontent.faae2-1.fna&oh=00_AT_plvkQxDjY8ZMgjfpVKlbg6iCm4BfFQUrtGJD3AGyhJA&oe=63241A67"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: Get.width * 0.52,
                  
                      child: Flexible(
                        child: Text(
                          dashboardControllerImp
                              .user.name!,
                          overflow: TextOverflow
                              .visible,
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                        Ionicons.create_outline,
                        color: Colors.white,
                        size: 30))
              ])
            ],
          ),
        ));
  }
}
