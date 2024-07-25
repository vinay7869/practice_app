// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:practice_app/otp.dart';

// class Repository {
//   void signIn(BuildContext context, String phoneNumber) async {
//     try {
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (phoneAuthCredential) async {
//           await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
//         },
//         verificationFailed: (error) {
//           throw Exception(error.message);
//         },
//         codeSent: (verificationId, forceResendingToken) async {
//           await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => OTPScreen(verificationId: verificationId),
//               ));
//         },
//         codeAutoRetrievalTimeout: (verificationId) {},
//       );
//     } on FirebaseAuthException catch (e) {
//       e.message;
//     }
//   }

//   void otpLogic(
//       BuildContext context, String verificationId, String smsCode) async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId, smsCode: smsCode);
//     await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }
