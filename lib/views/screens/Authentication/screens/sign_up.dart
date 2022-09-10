// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:phone_authentication_app/utils/error_dialog.dart';
// import 'package:phone_authentication_app/widgets/gesture_detector_button.dart';

// import '../utils/navigate_to_otp_page.dart';
// import '../widgets/reusable_textfield.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
  
  
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController fullNameController = TextEditingController();

//   verifyPhoneNumber() async {
//     FirebaseAuth auth = FirebaseAuth.instance;

//     // VERIFY PHONE NUMBER METHOD
//     await auth.verifyPhoneNumber(
//       // PHONE NUMBER TO SEND OTP
//       phoneNumber: '+213${phoneController.text}',

//       // WHEN VERIFICATION IS COMPLETED
//       verificationCompleted: (PhoneAuthCredential credential) {},

//       // WHEN VERIFICATION IS FAILED
//       verificationFailed: (FirebaseAuthException e) {
//         errorDialog(
//           context: context,
//           exception: e,
//         );
//       },

//       // WHEN CODE IS SENT
//       codeSent: (String verificationId, int? resendToken) {
//         navigateToOTPPage(
//           context: context,
//           phoneController: phoneController,
//           fullNameController: fullNameController,
//           verificationId: verificationId,
//           isTimeOut2: false,
//         );
//       },

//       // WHEN CODE IS TIMEOUT
//       timeout: const Duration(seconds: 10),

//       // WHEN CODE AUTO RETRIEVAL IS TIMEOUT
//       codeAutoRetrievalTimeout: (String verificationId) {
//         navigateToOTPPage(
//           context: context,
//           phoneController: phoneController,
//           fullNameController: fullNameController,
//           verificationId: verificationId,
//           isTimeOut2: true,
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Center(
//             child: Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(top: 30.0),
//                   child: Text(
//                     "Sign Up",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: Get.height * 0.05),
//                 Container(
//                   height: Get.height * 0.35,
//                   width: Get.width * 0.8,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFE9F4FF),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 10,
//                         spreadRadius: 5,
//                       ),
//                     ],
//                     image: DecorationImage(
//                       image: AssetImage("assets/images/login.jpg"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: Get.height * 0.05),
//                 ReusableTextInputField(
//                   labelText: "Full Name",
//                   hintText: "Enter your full name",
//                   icon: Icons.person,
//                   controller: fullNameController,
//                 ),
//                 SizedBox(height: Get.height * 0.02),
//                 ReusableTextInputField(
//                   labelText: "Phone Number",
//                   hintText: "Enter your phone number",
//                   icon: Icons.phone,
//                   controller: phoneController,
//                 ),

//                 SizedBox(height: Get.height * 0.07),

//                 // SIGN UP BUTTON
//                 GestureDetectorButton(
//                   onTap: () {
//                     verifyPhoneNumber();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
