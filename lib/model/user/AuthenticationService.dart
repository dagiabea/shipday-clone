// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthenticationService {
//   Future signUpWithEmail({
//     required User user,
//     required String password,
//     required String fullName,
//     required String role,
//     required String plate,
//     required String city,
//     required String phone,
//   }) async {
//     try {
//       var authResult = await FirebaseAuth.createUserWithEmailAndPassword(
//         email: user.email,
//         password: password,
//       );
//       // TODO: Create firestore user here and keep it locally.
//       return authResult.user != null;
//     } catch (e) {
//       return e.message;
//     }
//   }
// }
