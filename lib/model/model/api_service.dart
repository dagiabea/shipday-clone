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
        List<Ordersmodel> model = ordersmodelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

//https://shipday-drive-default-rtdb.firebaseio.com/orders/0/status.json
//body "on the way or other status"

  
}
