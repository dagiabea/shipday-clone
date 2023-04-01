import 'package:flutter/material.dart';
import 'package:tr1/screens/login_page/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shipday',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.grey,
      ),
      home: const LoginPage(),
      //home: const OrderTrackingPage(),
    );
  }
}