import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tr1/model/model/waiting_order/waiting_order_model.dart';

import '../../../constants.dart';


class WaitngOrdersApiService {
  Future<List<WaitingOrder>?> getWaitingOrders() async {
    try {
      var url = Uri.parse(WaitingOrdersApiConstants.baseUrl + WaitingOrdersApiConstants.endpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {

        print(response.body.toString());
        
        List<WaitingOrder> model = ordersmodelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<WaitingOrder>?> postToOrders() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.post(url,body: "post");
      if (response.statusCode == 200) {

        print(response.body.toString());
        
        List<WaitingOrder> model = ordersmodelFromJson(response.body);
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
