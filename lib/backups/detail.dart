// import 'package:flutter/material.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // Here we have created list of steps
//   // that are required to complete the for

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             margin: const EdgeInsets.only(left: 20),
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             child: Column(
//                 //crossAxisAlignment: CrossAxisAlignment.start,
//                 //mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TimelineTile(
//                       isFirst: true,
//                       alignment: TimelineAlign.start,
//                       indicatorStyle: const IndicatorStyle(
//                         indicatorXY: 0,
//                         padding: EdgeInsets.only(bottom:1),
//                         indicator: Icon(
//                           Icons.adjust,
//                           color: Colors.grey,
//                           size: 16,
//                         ),
//                       ),
//                       afterLineStyle: const LineStyle(
//                         thickness: 1,
//                         color: Colors.black,
//                       ),
//                       beforeLineStyle: const LineStyle(
//                         thickness: 1,
//                         color: Colors.black,
//                       ),
//                       endChild: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text(
//                             "status",
//                             style: TextStyle(
//                               fontSize: 16,
//                               //fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             "You have successfully picked up the package",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.black,
//                             ),
//                           ),
//                           //const SizedBox(height: 55),
//                         ],
//                       )),

                      

//                   TimelineTile(
//                       isLast: true,
//                       alignment: TimelineAlign.start,
//                       indicatorStyle: const IndicatorStyle(
//                         indicatorXY: 0,
//                         padding: EdgeInsets.only(top:1),
//                         indicator: Icon(
//                           Icons.location_on,
//                           color: Colors.grey,
//                           size: 16,
//                         ),
//                       ),
//                       afterLineStyle: const LineStyle(
//                         thickness: 1,
//                         color: Colors.black,
//                       ),
//                       beforeLineStyle: const LineStyle(
//                         thickness: 1,
//                         color: Colors.black,
//                       ),
//                       endChild: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text(
//                             "status",
//                             style: TextStyle(
//                               fontSize: 16,
//                               //fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             "You have successfully picked up the package",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.black,
//                             ),
//                           ),
//                           //const SizedBox(height: 55),
//                         ],
//                       )),

//                 ])));
//   }
// }


//     // TimelineTile(  
//     //   nodeAlign: TimelineNodeAlign.start,
//     //   //nodePosition: 1,
//     //   node: const TimelineNode(
//     //     indicator: Icon(
//     //         Icons.adjust,
//     //         color: Colors.grey,
//     //         size: 16,
//     //     ),
        
//     //     startConnector: SolidLineConnector(
//     //       color: Colors.black,
//     //       thickness: 1,
//     //     ),
//     //     endConnector: SolidLineConnector(
//     //       color: Colors.black,
//     //       thickness: 1,
//     //     ),
//     //   ),
//     // ),