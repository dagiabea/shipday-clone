import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../welcome_page/home_profile.dart';
import 'login_screen.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeProfile();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
