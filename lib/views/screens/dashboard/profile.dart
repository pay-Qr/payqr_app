import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payqr/core/constants/style.dart';
import 'package:payqr/views/widgets/profile/divider.dart';

import '../../widgets/profile/profile_detals.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: Get.height * 0.25,
                        decoration: const BoxDecoration(
                          color: Color(0xFF757FD8),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(80.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Get.height * 0.25,
                        decoration: const BoxDecoration(
                          color: Color(0xFF757FD8),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Row(
                    children: [
                      // BACK BUTTON
                      GestureDetector(
                        onTap: () {
                          // Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF757FD8),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.black,
                              width: 4,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: Get.width * 0.2,
                      ),

                      // TITLE
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // PROFILE PICTURE
                Positioned(
                  top: 120,
                  left: 150,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: const [
                      // PROFILE PICTURE
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/images/profile_image.jpg'),
                      ),

                      // CAMERA ICON
                      Positioned(
                        bottom: -8,
                        right: -10,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // profile information container
            SizedBox(
              height: Get.height * 0.07,
            ),

            // SECOND STACK
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // FULL NAME
                        ProfileDetails(
                          icon: Icons.person,
                          title: 'Hanane Nacer',
                        ),

                        LineDivider(),

                        // PHONE NUMBER
                        ProfileDetails(
                          icon: Icons.phone,
                          title: '+216 25 000 000',
                        ),

                        LineDivider(),

                        // EMAIL
                        ProfileDetails(
                          icon: Icons.email,
                          title: 'hanane@gmail.com',
                        ),

                        LineDivider(),

                        // CARD CODE
                        ProfileDetails(
                          icon: Icons.credit_card,
                          title: 'card code',
                        ),
                      ],
                    ),
                  ),
                ),

                // IDENTITY VERIFICATION BUTTON
                Positioned(
                  top: 320,
                  right: 0,
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: IDENTITY VERIFICATION
                      // Get.to(() => IdentityVerification());
                    },
                    child: Container(
                      height: Get.height * 0.10,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // TEXT
                          Text(
                            'Identity Verification',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            width: Get.width * 0.10,
                          ),

                          // ICON
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey.shade500,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: Get.height * 0.12,
            ),

            // SIGN OUT BUTTON

            GestureDetector(
              onTap: (){
                // TODO: SIGN OUT
                // Get.offAll(() => Login());
              },
              child: Container(
                height: Get.height * 0.10,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // ICON
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey.shade500,
                        size: 25,
                      ),
            
                      SizedBox(
                        width: Get.width * 0.10,
                      ),
            
                      // TEXT
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
