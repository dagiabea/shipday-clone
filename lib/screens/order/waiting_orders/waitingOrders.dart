import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tr1/screens/order/order_list/order_list.dart';
import '../../../constants.dart';
import '../../../map/map_screen.dart';
import '../../../model/model/waiting_order/waiting_order_model.dart';
import '../../../model/model/waiting_order/waitingorder_api_service.dart';
import 'package:http/http.dart' as http;

class WaitingOrders extends StatefulWidget {
  const WaitingOrders({super.key});

  @override
  State<WaitingOrders> createState() => _WaitingOrdersState();
}

class _WaitingOrdersState extends State<WaitingOrders> {
  late List<WaitingOrder>? _waitingOrdersmodel = [];

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      GlobalKey<ScaffoldState>();
  bool loading = false;
  @override
  void initState() {
    _getWaitingOrdersData();
    super.initState();
    //_makePutRequest();
  }

  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  void _changeOrderStatus(int index, String status) async {
    loading = true;
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
          _getWaitingOrdersData();
        }));
    final url = Uri.parse(
        'https://shipday-drive-default-rtdb.firebaseio.com/waiting_orders/${index}.json');
    // final headers = {"Content-type": "application/json"};

    loading = true;
    final json = '{"status": "${status}"}';
    final response = await http.patch(url, headers: headers, body: json);
    //loading = false;

    if (response.statusCode == 200) {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => setState(() {
                _getWaitingOrdersData();
              }))
          .then((value) => loading = false);

      print('Status code: ${response.statusCode}');
    } else {
      loading = false;
    }
    //print('Status code: ${response.statusCode}');
    //print('Body: ${response.body}');
  }

  void _getWaitingOrdersData() async {
    _waitingOrdersmodel = (await WaitngOrdersApiService().getWaitingOrders());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _posttoOrdersData() async {
    final url = Uri.parse('https://shipday-drive-default-rtdb.firebaseio.com/current_orders/orders.json');
    final response = await http.post(url, headers: headers, body: "json");
    print('Status code: ${response.statusCode}');
  }

  void _rejectOrder(int index) async {
    loading = true;
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
          _getWaitingOrdersData();
        }));
    final url = Uri.parse(
        'https://shipday-drive-default-rtdb.firebaseio.com/waiting_orders/${index}.json');
    // final headers = {"Content-type": "application/json"};

    loading = true;
    //final json = '{"status": "${status}"}';
    final response = await http.delete(url);
    //loading = false;

    if (response.statusCode == 200) {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => setState(() {
                _getWaitingOrdersData();
              }))
          .then((value) => loading = false);

      print('Status code: ${response.statusCode}');
    } else {
      loading = false;
    }
    //print('Status code: ${response.statusCode}');
    //print('Body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
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
                  _getWaitingOrdersData();
                });
              });
            },
            child: Scaffold(
                backgroundColor: Colors.blueGrey[50],
                key: _drawerscaffoldkey,
                drawer: drawer(context),
                body: _waitingOrdersmodel == null ||
                        _waitingOrdersmodel!.isEmpty
                    ? SpinKitFadingCircle(color: Constants.primaryColor)
                    : ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: _waitingOrdersmodel!.length,
                        itemBuilder: (context, index) {
                          return singleOrderCard(index, context);
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ))));
  }

  Card singleOrderCard(int index, BuildContext context) {
    return Card(
      color: Colors.white,
      borderOnForeground: true,
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Distance",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: Constants.secondnormalFontSize),
                  ),
                  Text(
                    'Earnings',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: Constants.secondnormalFontSize),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _waitingOrdersmodel![index].distance.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.secondboldFontSize),
                  ),
                  Text(
                    _waitingOrdersmodel![index].totalEarnings.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.secondboldFontSize),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 197, 191, 191),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                "#${_waitingOrdersmodel![index].orderId}",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  label: Text(
                    _waitingOrdersmodel![index].pickupFrom.toString(),
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
                    _waitingOrdersmodel![index].pickupTime.toString(),
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
                    _waitingOrdersmodel![index].pickupAddress.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.normalFontSize),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Text(
                    _waitingOrdersmodel![index].pickupDate.toString(),
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
                    _waitingOrdersmodel![index].deliverTo.toString(),
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
                    _waitingOrdersmodel![index].deliverTime.toString(),
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
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Text(
                      _waitingOrdersmodel![index].deliveryAddress.toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: Constants.normalFontSize),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Text(
                    _waitingOrdersmodel![index].deliverDate.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.normalFontSize),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [rejectButton(index), acceptButton(index)],
            ),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderList()),
                );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                //MapUtils.openMap("2PMP+83X, አዲስ አበባ");
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

  Container rejectButton(int index) {
    //loading = true;
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      height: MediaQuery.of(context).size.width * 0.10,
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 10),
      decoration: BoxDecoration(
          color: Constants.rejectColor,
          borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Reject",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
        onPressed: () {
          _rejectOrder(index);
          //_changeOrderStatus(index, "reject");
          //_makePutRequest(index, "picked up");
        },
      ),
    );
  }

  Container acceptButton(int index) {
    //loading = true;
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      height: MediaQuery.of(context).size.width * 0.10,
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 5),
      decoration: BoxDecoration(
          color: Constants.onthewaycolor,
          borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Accept",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
        onPressed: () {
          _posttoOrdersData();
          //_changeOrderStatus(index, "accept");
        },
      ),
    );
  }
}
