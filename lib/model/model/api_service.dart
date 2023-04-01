import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import 'modelclass.dart';

class ApiService2 {
  Future<List<Ordersmodel>?> getOrders() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Ordersmodel> _model = ordersmodelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

//https://shipday-drive-default-rtdb.firebaseio.com/orders/0/status.json
//body "on the way or other status"

  
}
