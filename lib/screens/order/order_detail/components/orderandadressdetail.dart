import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../../model/model/modelclass.dart';

class OrderDetailandAddress extends StatefulWidget {
  const OrderDetailandAddress({
    super.key,
    this.deliveryinstraction = "",
    required this.ordernumber,
    //required this.price,
    required this.status,
    required this.placementdate,
    required this.placementtime,
    required this.pickedupdate,
    required this.pickeduptime,
    required this.pickedupfromname,
    required this.pickedupaddress,
    required this.pickedupfromphonenumber,
    required this.delivedate,
    required this.delivetime,
    required this.delivetoname,
    required this.delivetoaddress,
    required this.delivetophonenumber,
    required this.orderitems,
    required this.totalfee,

    // required this.itemCount,
    // required this.itemName,
    // required this.itemPrice,
  });

  final String ordernumber;
  //final String price;

  final String status;

  final String placementdate;
  final String placementtime;

  final String pickedupdate;
  final String pickeduptime;
  final String pickedupfromname;
  final String pickedupaddress;
  final String pickedupfromphonenumber;

  final String delivedate;
  final String delivetime;
  final String delivetoname;
  final String delivetoaddress;
  final String delivetophonenumber;

  final String deliveryinstraction;

  final List<OrderItem> orderitems;
  final List<TotalFee> totalfee;

  //final OrderItem orderItem;
  // final String itemCount;
  // final String itemName;
  // final String itemPrice;

  // final List<OrderItem>? _OrderItem = [];

  @override
  State<OrderDetailandAddress> createState() => _OrderDetailandAddressState();
}

class _OrderDetailandAddressState extends State<OrderDetailandAddress> {
  // For storing the current position
  late Position _currentPosition;

  @override
  void initState() {
    super.initState();
    //_getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Container(
              margin: const EdgeInsets.only(left: 15),
              color: Colors.white,
              //borderOnForeground: true,
              //elevation: 10,
              child: orderNumberandOrderInfo()),
        ),

        widget.deliveryinstraction.isEmpty
        ?deliveryInstraction(widget.deliveryinstraction, false)

        :deliveryInstraction(widget.deliveryinstraction, true),

        //Order Items Title
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: const Column(
            children: [
              Center(
                  child: Text(
                "ORDER ITEMS",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ))
            ],
          ),
        ),

        //order Items
        orderItemsWidget(),

        //Total Items
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              totalItemsandPrice(),
              Divider(
                thickness: 2,
                color: Colors.blueGrey[100],
              ),
            ],
          ),
        ),

        //Tax, Delivery Fee, Delivery Tips, Discount
        taxContainer(),
      ],
    );
  }

  ListView orderItemsWidget() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: widget.orderitems.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      //itemCount
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey[100],
                        maxRadius: 10,
                        child: Text(
                          widget.orderitems[index].itemCount,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),

                      //item Name
                      Text(
                        widget.orderitems[index].itemName,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14),
                      )
                    ],
                  ),

                  //item Price
                  Text.rich(TextSpan(
                      //style: TextStyle(color: Colors.redAccent), //apply style to all
                      children: [
                        TextSpan(
                            text: widget.orderitems[index].itemPrice,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14)),
                        // const TextSpan(
                        //     text: ' Birr',
                        //     style: TextStyle(
                        //       fontSize: 14,
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.normal,
                        //     )),
                      ])),
                ],
              ),
            ],
          ),
        );
      },
      // separatorBuilder: (BuildContext context, int index) =>
      //     const Divider(),
    );
  }

  Container taxContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                //Tax Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Tax:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text.rich(TextSpan(
                        //style: TextStyle(color: Colors.redAccent), //apply style to all
                        children: [
                          TextSpan(
                              text: widget.totalfee[0].tax,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 22, 19, 19),
                                  fontSize: 14)),
                          // const TextSpan(
                          //     text: ' Birr',
                          //     style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.normal,
                          //     )),
                        ])),
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),

                //Delivery Fee Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Delivery Fee:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text.rich(TextSpan(
                        //style: TextStyle(color: Colors.redAccent), //apply style to all
                        children: [
                          TextSpan(
                              text: widget.totalfee[0].deliveryFee,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 14)),
                          // const TextSpan(
                          //     text: ' Birr',
                          //     style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.normal,
                          //     )),
                        ])),
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),

                //Delivery Tips Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Delivery Tips:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text.rich(TextSpan(
                        //style: TextStyle(color: Colors.redAccent), //apply style to all
                        children: [
                          TextSpan(
                              text: widget.totalfee[0].deliveryTip,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 14)),
                          // const TextSpan(
                          //     text: ' Birr',
                          //     style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.normal,
                          //     )),
                        ])),
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),

                //Discount Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Discount:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.red),
                    ),
                    Text.rich(TextSpan(
                        //style: TextStyle(color: Colors.redAccent), //apply style to all
                        children: [
                          TextSpan(
                              text: widget.totalfee[0].discount,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 14)),
                          // const TextSpan(
                          //     text: ' Birr',
                          //     style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.normal,
                          //     )),
                        ])),
                  ],
                ),

                totalPrice(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container totalItemsandPrice() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(TextSpan(
              //style: TextStyle(color: Colors.redAccent), //apply style to all
              children: [
                const TextSpan(
                    text: 'Total Items: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15)),
                TextSpan(
                    text: widget.orderitems.length.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ])),
          const Text.rich(TextSpan(
              //style: TextStyle(color: Colors.redAccent), //apply style to all
              children: [
                TextSpan(
                    text: "20",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15)),
                TextSpan(
                    text: " Birr",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ])),
        ],
      ),
    );
  }

  Column orderNumberandOrderInfo() {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 15, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //const SizedBox(width: 5,),
            Text.rich(TextSpan(
                //style: TextStyle(color: Colors.redAccent), //apply style to all
                children: [
                  const TextSpan(
                      text: 'Order #: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 16)),
                  TextSpan(
                      text: widget.ordernumber,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  // TextSpan(
                  //     text: widget.price,
                  //     style: const TextStyle(
                  //         fontSize: 16,
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.bold))
                ])),

            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // launchUrl(Uri.parse(
                    //    'https://www.google.com/maps/dir/?api=1&origin=8.988884,38.761502&destination=9.036559,%2038.754370'));
                    //MapUtils.openMap(8.988884,38.761502);
                  },
                  child: Text(
                    widget.status,
                    style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // const SizedBox(
                //   width: 5,
                // ),
                const Icon(
                  Icons.near_me_outlined,
                  color: Colors.grey,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 15, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //const SizedBox(width: 5,),
            Text.rich(TextSpan(
                //style: TextStyle(color: Colors.redAccent), //apply style to all
                children: [
                  const TextSpan(
                      text: 'Placement time: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 14)),
                  TextSpan(
                      text: '${widget.placementdate}, ',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                  TextSpan(
                      text: widget.placementtime,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ])),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const Divider(
        thickness: 1,
        color: Color.fromARGB(255, 197, 191, 191),
      ),
      pickUpDetail(),
    ]);
  }

  Container pickUpDetail() {
    return Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 5),
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              TimelineTile(
                  isFirst: true,
                  alignment: TimelineAlign.start,
                  indicatorStyle: const IndicatorStyle(
                    indicatorXY: 0,
                    padding: EdgeInsets.only(bottom: 1),
                    indicator: Icon(
                      Icons.adjust_rounded,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                  afterLineStyle: const LineStyle(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  beforeLineStyle: const LineStyle(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  endChild: Container(
                    margin: const EdgeInsets.only(left: 10, top: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(
                            //style: TextStyle(color: Colors.redAccent), //apply style to all
                            children: [
                              const TextSpan(
                                  text: 'Pick Up ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 14)),
                              TextSpan(
                                  text: '${widget.pickedupdate}, ',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: widget.pickeduptime,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ])),
                        const SizedBox(height: 8),
                        Text(
                          widget.pickedupfromname,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text.rich(TextSpan(
                            //style: TextStyle(color: Colors.redAccent), //apply style to all
                            children: [
                              TextSpan(
                                  text: '${widget.pickedupaddress}, ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 16)),
                            ])),
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(
                                Icons.call_outlined,
                                color: Colors.grey,
                              )),
                              const TextSpan(text: '   '),
                              TextSpan(
                                  text: widget.pickedupfromphonenumber,
                                  style: TextStyle(color: Colors.green[400])),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )),

              //SizedBox(height: 30),

              //Delivery Detail
              deliveryDetail(),
            ]));
  }

  Container deliveryDetail() {
    return Container(
        alignment: Alignment.topLeft,
        //margin: const EdgeInsets.only(left: 15,top:5),
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              TimelineTile(
                  isLast: true,
                  alignment: TimelineAlign.start,
                  indicatorStyle: const IndicatorStyle(
                    indicatorXY: 0,
                    padding: EdgeInsets.only(bottom: 1),
                    indicator: Icon(
                      Icons.location_on_rounded,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                  afterLineStyle: const LineStyle(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  beforeLineStyle: const LineStyle(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  endChild: Container(
                    margin: const EdgeInsets.only(left: 10, top: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(
                            //style: TextStyle(color: Colors.redAccent), //apply style to all
                            children: [
                              const TextSpan(
                                  text: 'Deliver ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 14)),
                              TextSpan(
                                  text: ' ${widget.delivedate},',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' ${widget.delivetime}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ])),
                        const SizedBox(height: 8),
                        Text(
                          widget.delivetoname,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text.rich(TextSpan(
                            //style: TextStyle(color: Colors.redAccent), //apply style to all
                            children: [
                              TextSpan(
                                  text: '${widget.delivetoaddress}, ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 16)),
                            ])),
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(
                                Icons.call_outlined,
                                color: Colors.grey,
                              )),
                              const TextSpan(text: '   '),
                              TextSpan(
                                  text: widget.delivetophonenumber,
                                  style: TextStyle(color: Colors.green[400])),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ))
            ]));
  }

  Visibility deliveryInstraction(String instraction, bool visbility) {
    return Visibility(
      visible: visbility,
      child: Container(
        margin: const EdgeInsets.all(10),
        //color: Colors.white,
        child: Card(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Delivery Instraction: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    instraction,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(height: 10),
              ]),
        ),
      ),
    );
  }

  Container totalPrice() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 50),

      //color: Colors.white,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "Total",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Text.rich(TextSpan(
                        //style: TextStyle(color: Colors.redAccent), //apply style to all
                        children: [
                          TextSpan(
                              text: "120",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20)),
                          TextSpan(
                              text: ' Birr',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ])),
                  ),
                  //const SizedBox(height: 10),
                ]),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
