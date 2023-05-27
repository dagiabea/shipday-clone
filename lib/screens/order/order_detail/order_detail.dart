import 'package:flutter/material.dart';
import '../../../model/model/modelclass.dart';
import 'components/orderandadressdetail.dart';

class OrderDetail extends StatelessWidget {
  final Ordersmodel ordersmodel;
  //final OrderItem orderItem;
  
  const OrderDetail({super.key, required this.ordersmodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            "Order Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: OrderDetailandAddress(
            ordernumber: ordersmodel.orderId.toString(),
            //price: '123.56',
            status: ordersmodel.status.toString(),
            
            placementdate: ordersmodel.pickupDate.toString(),
            placementtime: ordersmodel.pickupTime.toString(),
            
            pickedupaddress: ordersmodel.pickupAddress.toString(),
            pickedupdate: ordersmodel.pickupDate.toString(),
            pickedupfromname: ordersmodel.pickupFrom.toString(),
            pickeduptime: ordersmodel.pickupTime.toString(),
            pickedupfromphonenumber: ordersmodel.pickupPhone.toString(),
            
            delivedate: ordersmodel.deliverDate.toString(),
            delivetime: ordersmodel.deliverTime.toString(),
            delivetoaddress: ordersmodel.deliveryAddress.toString(),
            delivetoname: ordersmodel.deliverTo.toString(),
            delivetophonenumber: ordersmodel.deliverPhone.toString(),
            deliveryinstraction: ordersmodel.deliveryInstraction.toString(), 
            
            orderitems: ordersmodel.orderItems, 
            totalfee: ordersmodel.totalFee, 
            
            
          ),
        ));
  }
}
