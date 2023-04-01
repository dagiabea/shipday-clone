// import 'package:flutter/material.dart';
// import 'package:tr1/backups/api%20try/model2.dart';
// import 'api_service.dart';

// class Homee extends StatefulWidget {
//   const Homee({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Homee> {
//   late List<Ordersmodel>? _userModel = [];
//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }

//   void _getData() async {
//     _userModel = (await ApiService().getUsers())!;
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('REST API Example'),
//       ),
//       body: _userModel == null || _userModel!.isEmpty
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: _userModel!.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(_userModel![index].deliverDate.toString()),
//                           Text(_userModel![index].deliverTo),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(_userModel![index].pickupDate),
//                           Text(_userModel![index].pickupFrom),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }