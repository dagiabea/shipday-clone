import 'package:tr1/screens/order/waiting_orders/waitingOrders.dart';

import '../../../map/maputils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:tr1/map/map_screen.dart';
import '../../../model/model/api_service.dart';
import '../../../model/model/modelclass.dart';
import '../order_detail/order_detail.dart';
import 'package:flutter/cupertino.dart';
import '../../../constants.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  late List<Ordersmodel>? _Ordersmodel = [];
  late String updatestatus;

  bool loading = false;

  //late List<OrderItem>? _OrderItem = [];
  @override
  void initState() {
    _getData();
    super.initState();
    //_makePutRequest();
  }

  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  void _makePutRequest(int index, String status) async {
    loading = true;
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
            _getData();
          }));
    final url = Uri.parse(
        'https://shipday-drive-default-rtdb.firebaseio.com/current_orders/orders/${index}.json');
    // final headers = {"Content-type": "application/json"};

    loading = true;
    final json = '{"status": "${status}"}';
    final response = await http.patch(url, headers: headers, body: json);
    //loading = false;

    if (response.statusCode == 200) {
      
      Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {
            _getData();
          })).then((value) => loading = false);

      print('Status code: ${response.statusCode}');
    } else {
      loading = false;
    }
    //print('Status code: ${response.statusCode}');
    //print('Body: ${response.body}');
  }

  void _getData() async {
    _Ordersmodel = (await ApiService2().getOrders())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      GlobalKey<ScaffoldState>();
      
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[50],
          elevation: 1,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              //on drawer menu pressed
              if (_drawerscaffoldkey.currentState!.isDrawerOpen) {
                //if drawer is open, then close the drawer
                Navigator.pop(context);
              } else {
                _drawerscaffoldkey.currentState!.openDrawer();
                //if drawer is closed then open the drawer.
              }
            },
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapScreen()),
                );
              },
              icon: const Icon(Icons.map_outlined),
            )
          ],
        ),
        body: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  _getData();
                });
              });
            },
            child: loading
                ? SpinKitFadingCircle(color: Constants.primaryColor)
                : mainScafoold(context)));
  }

  Scaffold mainScafoold(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        key: _drawerscaffoldkey,
        drawer: drawer(context),
        body: _Ordersmodel == null || _Ordersmodel!.isEmpty
            ? SpinKitFadingCircle(color: Constants.primaryColor)
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: _Ordersmodel!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const OrderDetail()),
                      // );
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OrderDetail(
                                ordersmodel: Ordersmodel(
                                  orderId:
                                      _Ordersmodel![index].orderId.toString(),
                                  status:
                                      _Ordersmodel![index].status.toString(),
                                  pickupFrom: _Ordersmodel![index]
                                      .pickupFrom
                                      .toString(),
                                  pickupAddress: _Ordersmodel![index]
                                      .pickupAddress
                                      .toString(),
                                  pickupTime: _Ordersmodel![index]
                                      .pickupTime
                                      .toString(),
                                  pickupDate: _Ordersmodel![index]
                                      .pickupDate
                                      .toString(),
                                  pickupPhone: _Ordersmodel![index]
                                      .pickupPhone
                                      .toString(),
                                  deliverTo:
                                      _Ordersmodel![index].deliverTo.toString(),
                                  deliveryAddress: _Ordersmodel![index]
                                      .deliveryAddress
                                      .toString(),
                                  deliverTime: _Ordersmodel![index]
                                      .deliverTime
                                      .toString(),
                                  deliverDate: _Ordersmodel![index]
                                      .deliverDate
                                      .toString(),
                                  deliverPhone: _Ordersmodel![index]
                                      .deliverPhone
                                      .toString(),
                                  deliveryInstraction: _Ordersmodel![index]
                                      .deliveryInstraction
                                      .toString(),
                                  orderItems: _Ordersmodel![index].orderItems,
                                  totalFee: _Ordersmodel![index].totalFee,
                                ),
                              )));
                    },
                    child: singleOrderCard(index, context),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ));
  }

  Card singleOrderCard(int index, BuildContext context) {
    return Card(
      color: Colors.white,
      borderOnForeground: true,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: Text(
                    _Ordersmodel![index].status.toString(),
                    style: const TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {/* ... */},
                ),
                TextButton.icon(
                  label: const Text(
                    'Call',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    _makePutRequest(index, "chanh");
                    //setState(() {
                    //changeStatus(0, "started");
                    //_getData();
                    //});
                  },
                  icon: const Icon(
                    // <-- Icon
                    Icons.phone_outlined,
                    size: 16,
                  ),
                ),
                TextButton.icon(
                  label: const Text(
                    'Navigate',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => popup(
                            context,
                            _Ordersmodel![index].pickupAddress.toString(),
                            _Ordersmodel![index].deliveryAddress.toString()));
                  },
                  icon: const Icon(
                    // <-- Icon
                    Icons.near_me_outlined,
                    size: 16,
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 197, 191, 191),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 15),
              child: Text(
                _Ordersmodel![index].orderId.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  label: Text(
                    _Ordersmodel![index].pickupFrom.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.boldFontSize),
                  ),
                  onPressed: () {/* ... */},
                  icon: const Icon(
                    // <-- Icon
                    Icons.adjust,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    _Ordersmodel![index].pickupTime.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.boldFontSize),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    _Ordersmodel![index].pickupAddress.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.normalFontSize),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Text(
                    _Ordersmodel![index].pickupDate.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.normalFontSize),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  label: Text(
                    _Ordersmodel![index].deliverTo.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.boldFontSize),
                  ),
                  onPressed: () {/* ... */},
                  icon: const Icon(
                    // <-- Icon
                    Icons.location_on,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    _Ordersmodel![index].deliverTime.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.boldFontSize),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    _Ordersmodel![index].deliveryAddress.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.normalFontSize),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Text(
                    _Ordersmodel![index].deliverDate.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.normalFontSize),
                  ),
                ),
              ],
            ),
            _Ordersmodel![index].status.toString().toLowerCase() == "on the way"
                ? Visibility(
                    //visible: true,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        donechangeBackStatusButton(index),
                        markAsDoneButton(index),
                      ],
                    ),
                  )
                : _Ordersmodel![index].status.toString().toLowerCase() ==
                        "picked up"
                    ? Visibility(
                        //visible: true,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            onthewayBackStatusButton(index),
                            markAsOnTheWayButton(index),
                          ],
                        ),
                      )
                    : _Ordersmodel![index].status.toString().toLowerCase() ==
                            "started"
                        ? Visibility(
                            //visible: true,
                            child: markaspickedupbutton(index))
                        : const SizedBox(
                            height: 20,
                          )
          ],
        ),
      ),
    );
  }

  Drawer drawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[50],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ), //BoxDecoration
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blueGrey[200],
                            child: const Text(
                              "A",
                              style:
                                  TextStyle(fontSize: 30.0, color: Colors.blue),
                            ), //Text
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "User Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Current Orders',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15)),
                  Icon(
                    Icons.run_circle_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 1,
              color: Colors.grey,
            ),
            //
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WaitingOrders()),
                );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Waiting Orders',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15)),
                    Icon(
                      Icons.access_time_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 1,
              color: Colors.grey,
            ),
            //
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Homee()),
                // );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Completed Orders',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15)),
                    Icon(
                      Icons.check_circle_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),

            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 1,
              color: Colors.grey,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Performance',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15)),
                  Icon(
                    Icons.swap_vertical_circle_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
            ),

            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 1,
              color: Colors.grey,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15)),
                  Icon(
                    Icons.person_2_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
            ),

            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 1,
              color: Colors.grey,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Settings',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15)),
                  Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
            ),

            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 1,
              color: Colors.grey,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Language',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15)),
                  Icon(
                    Icons.language_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
            ),

            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 1,
              color: Colors.grey,
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Get Offline',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 15)),
                      Icon(
                        Icons.restart_alt_outlined,
                        color: Colors.black,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container onthewayBackStatusButton(int index) {
    return Container(
      //width: screenwidth,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.grey, spreadRadius: 1)
        ],
      ),
      margin: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 10),
      child: GestureDetector(
        onTap: () {
          // setState(() {
          //   _makePutRequest(index, "started");
          // });

          _makePutRequest(index, "started");
        },
        child: const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
            size: 16,
          ),
        ),
      ),
    );
  }

  Container donechangeBackStatusButton(int index) {
    return Container(
      //width: screenwidth,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.grey, spreadRadius: 1)
        ],
      ),
      margin: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 10),
      child: GestureDetector(
        onTap: () {
          _makePutRequest(index, "picked up");
        },
        child: const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
            size: 16,
          ),
        ),
      ),
    );
  }

  Container markaspickedupbutton(int index) {
    //loading = true;
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.width * 0.10,
      margin: const EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Constants.pickedupcolor,
          borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Mark as Picked Up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
        onPressed: () {
          _makePutRequest(index, "picked up");
        },
      ),
    );
  }

  Container markAsOnTheWayButton(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.68,
      height: MediaQuery.of(context).size.width * 0.10,
      margin: const EdgeInsets.only(top: 20, bottom: 15, left: 5, right: 20),
      decoration: BoxDecoration(
          color: Constants.onthewaycolor,
          borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Mark as On the way",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
        onPressed: () {
          _makePutRequest(index, "On the way");
        },
      ),
    );
  }

  Container markAsDoneButton(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.68,
      height: MediaQuery.of(context).size.width * 0.10,
      margin: const EdgeInsets.only(top: 20, bottom: 15, left: 5, right: 20),
      decoration: BoxDecoration(
          color: Constants.doneColor, borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Mark as Done",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
        onPressed: () {
          _makePutRequest(index, "Done");
        },
      ),
    );
  }

  Padding popup(
      BuildContext context, String customerLocation, String pickupLocation) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CupertinoActionSheet(
          actions: <Widget>[
            Container(
              color: Colors.white,
              child: CupertinoActionSheetAction(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      // <-- Icon
                      Icons.near_me_outlined,
                      size: 16,
                    ),
                    Spacer(),
                    Text(
                      'Navigate to Customer',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Spacer(),
                    //Spacer(),
                  ],
                ),
                onPressed: () {
                  MapUtils.openMap(customerLocation);
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: CupertinoActionSheetAction(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      // <-- Icon
                      Icons.near_me_outlined,
                      size: 16,
                    ),
                    Spacer(),
                    Text(
                      'Navigate to pick up location',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Spacer(),
                    //Spacer(),
                  ],
                ),
                onPressed: () {
                  MapUtils.openMap(pickupLocation);
                  //print('pressed');
                },
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(
              'Cancel',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
    );
  }
}
