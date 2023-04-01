// import 'package:flutter/material.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// class OrderDetail extends StatefulWidget {
//   const OrderDetail({super.key});

//   @override
//   State<OrderDetail> createState() => _OrderDetailState();
// }

// class _OrderDetailState extends State<OrderDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[100],
//         appBar: AppBar(
//           iconTheme: const IconThemeData(color: Colors.black),
//           backgroundColor: Colors.white,
//           elevation: 1,
//           title: const Text(
//             "Order Details",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             Container(
//               color: Colors.white,
//               child: Container(
//                   margin: const EdgeInsets.only(left: 15),
//                   color: Colors.white,
//                   //borderOnForeground: true,
//                   //elevation: 10,
//                   child:
//                       Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
//                     Container(
//                       margin: const EdgeInsets.only(right: 15, top: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           //const SizedBox(width: 5,),
//                           const Text.rich(TextSpan(
//                               //style: TextStyle(color: Colors.redAccent), //apply style to all
//                               children: [
//                                 TextSpan(
//                                     text: 'Order #: ',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.grey,
//                                         fontSize: 16)),
//                                 TextSpan(
//                                     text: ' Order Number Here ',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold)),
//                                 TextSpan(
//                                     text: '(Price)',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold))
//                               ])),

//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: const [
//                               Text(
//                                 "Status",
//                                 style: TextStyle(
//                                     color: Colors.yellow,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               // const SizedBox(
//                               //   width: 5,
//                               // ),
//                               Icon(
//                                 Icons.near_me_outlined,
//                                 color: Colors.grey,
//                                 size: 18,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(right: 15, top: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: const <Widget>[
//                           //const SizedBox(width: 5,),
//                           Text.rich(TextSpan(
//                               //style: TextStyle(color: Colors.redAccent), //apply style to all
//                               children: [
//                                 TextSpan(
//                                     text: 'Placement time: ',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.grey,
//                                         fontSize: 14)),
//                                 TextSpan(
//                                     text: ' Date,',
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.normal)),
//                                 TextSpan(
//                                     text: ' Time',
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.normal))
//                               ])),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Divider(
//                       thickness: 1,
//                       color: Color.fromARGB(255, 197, 191, 191),
//                     ),
//                     Container(
//                         alignment: Alignment.topLeft,
//                         margin: const EdgeInsets.only(top: 5),
//                         child: Column(
//                             //crossAxisAlignment: CrossAxisAlignment.start,
//                             //mainAxisSize: MainAxisSize.min,
//                             children: [
//                               TimelineTile(
//                                   isFirst: true,
//                                   alignment: TimelineAlign.start,
//                                   indicatorStyle: const IndicatorStyle(
//                                     indicatorXY: 0,
//                                     padding: EdgeInsets.only(bottom: 1),
//                                     indicator: Icon(
//                                       Icons.adjust_rounded,
//                                       color: Colors.grey,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   afterLineStyle: const LineStyle(
//                                     thickness: 1,
//                                     color: Colors.black,
//                                   ),
//                                   beforeLineStyle: const LineStyle(
//                                     thickness: 1,
//                                     color: Colors.black,
//                                   ),
//                                   endChild: Container(
//                                     margin:
//                                         const EdgeInsets.only(left: 10, top: 3),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text.rich(TextSpan(
//                                             //style: TextStyle(color: Colors.redAccent), //apply style to all
//                                             children: [
//                                               TextSpan(
//                                                   text: 'Pick Up ',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.grey,
//                                                       fontSize: 14)),
//                                               TextSpan(
//                                                   text: ' P-Date,',
//                                                   style: TextStyle(
//                                                       fontSize: 14,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                               TextSpan(
//                                                   text: ' P-Time',
//                                                   style: TextStyle(
//                                                       fontSize: 14,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold))
//                                             ])),
//                                         const SizedBox(height: 8),
//                                         const Text(
//                                           "Picked up from Who",
//                                           style: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 8),
//                                         const Text.rich(TextSpan(
//                                             //style: TextStyle(color: Colors.redAccent), //apply style to all
//                                             children: [
//                                               TextSpan(
//                                                   text: 'Address, ',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.normal,
//                                                       color: Colors.grey,
//                                                       fontSize: 16)),
//                                               TextSpan(
//                                                   text: 'City, ',
//                                                   style: TextStyle(
//                                                     fontSize: 16,
//                                                     color: Colors.grey,
//                                                     fontWeight:
//                                                         FontWeight.normal,
//                                                   )),
//                                               TextSpan(
//                                                   text: 'Country',
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       color: Colors.grey,
//                                                       fontWeight:
//                                                           FontWeight.normal))
//                                             ])),
//                                         const SizedBox(height: 8),
//                                         Text.rich(
//                                           TextSpan(
//                                             children: [
//                                               const WidgetSpan(
//                                                   child: Icon(
//                                                 Icons.call_outlined,
//                                                 color: Colors.grey,
//                                               )),
//                                               const TextSpan(text: '   '),
//                                               TextSpan(
//                                                   text: 'Phone Number',
//                                                   style: TextStyle(
//                                                       color:
//                                                           Colors.green[400])),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(height: 10),
//                                       ],
//                                     ),
//                                   )),

//                               //SizedBox(height: 30),

//                               //Delivery Detail
//                               Container(
//                                   alignment: Alignment.topLeft,
//                                   //margin: const EdgeInsets.only(left: 15,top:5),
//                                   child: Column(
//                                       //crossAxisAlignment: CrossAxisAlignment.start,
//                                       //mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         TimelineTile(
//                                             isLast: true,
//                                             alignment: TimelineAlign.start,
//                                             indicatorStyle:
//                                                 const IndicatorStyle(
//                                               indicatorXY: 0,
//                                               padding:
//                                                   EdgeInsets.only(bottom: 1),
//                                               indicator: Icon(
//                                                 Icons.location_on_rounded,
//                                                 color: Colors.grey,
//                                                 size: 16,
//                                               ),
//                                             ),
//                                             afterLineStyle: const LineStyle(
//                                               thickness: 1,
//                                               color: Colors.black,
//                                             ),
//                                             beforeLineStyle: const LineStyle(
//                                               thickness: 1,
//                                               color: Colors.black,
//                                             ),
//                                             endChild: Container(
//                                               margin: const EdgeInsets.only(
//                                                   left: 10, top: 3),
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   const Text.rich(TextSpan(
//                                                       //style: TextStyle(color: Colors.redAccent), //apply style to all
//                                                       children: [
//                                                         TextSpan(
//                                                             text: 'Deliver ',
//                                                             style: TextStyle(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                                 color:
//                                                                     Colors.grey,
//                                                                 fontSize: 14)),
//                                                         TextSpan(
//                                                             text: ' D-Date,',
//                                                             style: TextStyle(
//                                                                 fontSize: 14,
//                                                                 color: Colors
//                                                                     .black,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold)),
//                                                         TextSpan(
//                                                             text: ' D-Time',
//                                                             style: TextStyle(
//                                                                 fontSize: 14,
//                                                                 color: Colors
//                                                                     .black,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold))
//                                                       ])),
//                                                   const SizedBox(height: 8),
//                                                   const Text(
//                                                     "Deliver to",
//                                                     style: TextStyle(
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(height: 8),
//                                                   const Text.rich(TextSpan(
//                                                       //style: TextStyle(color: Colors.redAccent), //apply style to all
//                                                       children: [
//                                                         TextSpan(
//                                                             text: 'Address, ',
//                                                             style: TextStyle(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal,
//                                                                 color:
//                                                                     Colors.grey,
//                                                                 fontSize: 16)),
//                                                         TextSpan(
//                                                             text: 'City, ',
//                                                             style: TextStyle(
//                                                               fontSize: 16,
//                                                               color:
//                                                                   Colors.grey,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .normal,
//                                                             )),
//                                                         TextSpan(
//                                                             text: 'Country',
//                                                             style: TextStyle(
//                                                                 fontSize: 16,
//                                                                 color:
//                                                                     Colors.grey,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal))
//                                                       ])),
//                                                   const SizedBox(height: 8),
//                                                   Text.rich(
//                                                     TextSpan(
//                                                       children: [
//                                                         const WidgetSpan(
//                                                             child: Icon(
//                                                           Icons.call_outlined,
//                                                           color: Colors.grey,
//                                                         )),
//                                                         const TextSpan(
//                                                             text: '   '),
//                                                         TextSpan(
//                                                             text:
//                                                                 'Phone Number',
//                                                             style: TextStyle(
//                                                                 color: Colors
//                                                                         .green[
//                                                                     400])),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   const SizedBox(height: 15),
//                                                 ],
//                                               ),
//                                             ))
//                                       ])),
//                             ])),
//                   ])),
//             ),

//             Container(
//               margin: const EdgeInsets.all(10),
//               //color: Colors.white,
//               child: Card(
//                 child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       const SizedBox(height: 10),
//                       Container(
//                         margin: const EdgeInsets.only(left: 10),
//                         child: const Text(
//                           "Delivery Instraction: ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                               fontSize: 15),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Container(
//                         margin: const EdgeInsets.only(left: 10),
//                         child: const Text(
//                           "Instraction Text ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.normal,
//                               color: Colors.black,
//                               fontSize: 15),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                     ]),
//               ),
//             ),

//             Container(
//               margin: const EdgeInsets.only(top: 5),
//               child: Column(
//                 children: const [
//                   Center(
//                       child: Text(
//                     "ORDER ITEMS",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                     ),
//                   ))
//                 ],
//               ),
//             ),

//             //Ordered Items
//             Container(
//               margin: const EdgeInsets.all(15),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: Colors.blueGrey[100],
//                             maxRadius: 10,
//                             child: const Text(
//                               "2",
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           const Text("Item Name")
//                         ],
//                       ),
//                       const Text.rich(TextSpan(
//                           //style: TextStyle(color: Colors.redAccent), //apply style to all
//                           children: [
//                             TextSpan(
//                                 text: '12.00 ',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.black,
//                                     fontSize: 14)),
//                             TextSpan(
//                                 text: 'Birr',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.normal,
//                                 )),
//                           ])),
//                     ],
//                   ),

//                   //Total Items
//                   Container(
//                     margin: const EdgeInsets.only(top: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: const [
//                         Text.rich(TextSpan(
//                             //style: TextStyle(color: Colors.redAccent), //apply style to all
//                             children: [
//                               TextSpan(
//                                   text: 'Total Items: ',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                       fontSize: 15)),
//                               TextSpan(
//                                   text: 'Count',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                             ])),
//                         Text("total Birr",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             )),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 5),

//                   Divider(
//                     thickness: 2,
//                     color: Colors.blueGrey[100],
//                   ),

//                   //Tax, Delivery Fee, Delivery Tips, Discount
//                   Container(
//                     margin: const EdgeInsets.only(top: 10),
//                     child: Column(
//                       children: [
//                         //Tax Row
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: const [
//                             Text(
//                               "Tax:",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black),
//                             ),
//                             Text.rich(TextSpan(
//                                 //style: TextStyle(color: Colors.redAccent), //apply style to all
//                                 children: [
//                                   TextSpan(
//                                       text: '0.00 ',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color:
//                                               Color.fromARGB(255, 22, 19, 19),
//                                           fontSize: 14)),
//                                   TextSpan(
//                                       text: 'Birr',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.normal,
//                                       )),
//                                 ])),
//                           ],
//                         ),

//                         const SizedBox(
//                           height: 8,
//                         ),

//                         //Delivery Fee Row
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: const [
//                             Text(
//                               "Delivery Fee:",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black),
//                             ),
//                             Text.rich(TextSpan(
//                                 //style: TextStyle(color: Colors.redAccent), //apply style to all
//                                 children: [
//                                   TextSpan(
//                                       text: '0.00 ',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                           fontSize: 14)),
//                                   TextSpan(
//                                       text: 'Birr',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.normal,
//                                       )),
//                                 ])),
//                           ],
//                         ),

//                         const SizedBox(
//                           height: 8,
//                         ),

//                         //Delivery Tips Row
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: const [
//                             Text(
//                               "Delivery Tips:",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black),
//                             ),
//                             Text.rich(TextSpan(
//                                 //style: TextStyle(color: Colors.redAccent), //apply style to all
//                                 children: [
//                                   TextSpan(
//                                       text: '0.00 ',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                           fontSize: 14)),
//                                   TextSpan(
//                                       text: 'Birr',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.normal,
//                                       )),
//                                 ])),
//                           ],
//                         ),

//                         const SizedBox(
//                           height: 8,
//                         ),

//                         //Discount Row
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: const [
//                             Text(
//                               "Discount:",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.red),
//                             ),
//                             Text.rich(TextSpan(
//                                 //style: TextStyle(color: Colors.redAccent), //apply style to all
//                                 children: [
//                                   TextSpan(
//                                       text: '0.00 ',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                           fontSize: 14)),
//                                   TextSpan(
//                                       text: 'Birr',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.normal,
//                                       )),
//                                 ])),
//                           ],
//                         ),

//                         Container(
//                           margin: const EdgeInsets.only(top:10),
                          
//                           //color: Colors.white,
//                           child: Card(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 const SizedBox(height: 10),
//                                 Row(
//                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                    crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
                                      
//                                       Container(
//                                         margin: const EdgeInsets.only(left: 10),
//                                         child: const Text(
//                                           "Total",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                               fontSize: 20),
//                                         ),
//                                       ),

//                                       Container(
//                                         margin: const EdgeInsets.only(right: 10),
//                                         child: const Text.rich(TextSpan(
//                                             //style: TextStyle(color: Colors.redAccent), //apply style to all
//                                             children: [
//                                               TextSpan(
//                                                   text: '0.00 ',
//                                                   style: TextStyle(
//                                                       fontWeight: FontWeight.bold,
//                                                       color: Colors.black,
//                                                       fontSize: 20)),
//                                               TextSpan(
//                                                   text: 'Birr',
//                                                   style: TextStyle(
//                                                     fontSize: 20,
//                                                     color: Colors.black,
//                                                     fontWeight: FontWeight.bold,
//                                                   )),
//                                             ])),
//                                       ),
//                                       //const SizedBox(height: 10),
//                                     ]),
//                                     const SizedBox(height: 10),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }




