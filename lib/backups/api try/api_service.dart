// import 'dart:developer';
// import 'package:http/http.dart' as http;

// import '../../constants.dart';
// import 'model2.dart';

// class ApiService {
//   Future<List<Ordersmodel>?> getUsers() async {
//     try {
//       var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<Ordersmodel> _model = ordermodelFromJson(response.body);
//         return _model;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }