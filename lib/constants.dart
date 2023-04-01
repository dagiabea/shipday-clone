import 'package:flutter/material.dart';

class Constants {
  static String googleAPIkey = "AIzaSyDz931F7ThtYxXr_KqvcgmqUXLDq4qSbXc";
  static double normalFontSize = 12;
  static double boldFontSize = 15;

  static double secondnormalFontSize = 11;
  static double secondboldFontSize = 13;


  static Color primaryColor = const Color(0xff5511b0);

  static Color onthewaycolor = Color.fromARGB(255, 17, 194, 126);
  static Color pickedupcolor = const Color(0xff5511b0);
  static Color rejectColor = Colors.red;
  static Color doneColor = Color.fromARGB(255, 6, 150, 11);
}

class ApiConstants {
  static String baseUrl = 'https://shipday-drive-default-rtdb.firebaseio.com';
  static String usersEndpoint = '/current_orders/orders.json';
  //static String baseUrl = 'http://localhost:3000';
  //static String usersEndpoint = '/orders';
}

class WaitingOrdersApiConstants {
  static String baseUrl = 'https://shipday-drive-default-rtdb.firebaseio.com';
  static String endpoint = '/waiting_orders.json';
  //static String baseUrl = 'http://localhost:3000';
  //static String usersEndpoint = '/orders';
}


class ApiConstantsForUpdatingStatus {
  static String baseUrl =
      'https://shipday-drive-default-rtdb.firebaseio.com/current_orders/orders/0';
  static String endpoint = '/status.json';
  
}

class LocalAPIConstants {
  static String baseUrl =
      'http://192.168.0.110:3000';
  static String endpoint = '/orders';
}

//https://shipday-drive-default-rtdb.firebaseio.com/orders/0/status.json

class ApiConstants2 {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static String usersEndpoint = '/users';
}
