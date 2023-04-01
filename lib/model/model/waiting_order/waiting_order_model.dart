// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.waitingOrders,
    });

    List<WaitingOrder> waitingOrders;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        waitingOrders: List<WaitingOrder>.from(json["waiting_orders"].map((x) => WaitingOrder.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "waiting_orders": List<dynamic>.from(waitingOrders.map((x) => x.toJson())),
    };
}

List<WaitingOrder> ordersmodelFromJson(String str) => 
List<WaitingOrder>.from(json.decode(str).map((x) => WaitingOrder.fromJson(x)));

class WaitingOrder {
    WaitingOrder({
        required this.orderId,
        required this.distance,
        required this.pickupFrom,
        required this.pickupAddress,
        required this.pickupTime,
        required this.pickupDate,
        required this.deliverTo,
        required this.deliveryAddress,
        required this.deliverTime,
        required this.deliverDate,
        required this.totalEarnings,
        required this.status,
        required this.pickupPhone,
        required this.deliverPhone,
        required this.deliveryInstraction,
        required this.orderItems,
        required this.totalFee,
    });

    String orderId;
    String distance;
    String pickupFrom;
    String pickupAddress;
    String pickupTime;
    String pickupDate;
    String deliverTo;
    String deliveryAddress;
    String deliverTime;
    String deliverDate;
    String totalEarnings;
    String status;
    String pickupPhone;
    String deliverPhone;
    String deliveryInstraction;
    List<OrderItem> orderItems;
    List<TotalFee> totalFee;

    factory WaitingOrder.fromJson(Map<String, dynamic> json) => WaitingOrder(
        orderId: json["order_id"],
        distance: json["distance"],
        pickupFrom: json["pickup_from"],
        pickupAddress: json["pickup_address"],
        pickupTime: json["pickup_time"],
        pickupDate: json["pickup_date"],
        deliverTo: json["deliver_to"],
        deliveryAddress: json["delivery_address"],
        deliverTime: json["deliver_time"],
        deliverDate: json["deliver_date"],
        totalEarnings: json["total_earnings"],
        status: json["status"],
        pickupPhone: json["pickup_phone"],
        deliverPhone: json["deliver_phone"],
        deliveryInstraction: json["delivery_instraction"],
        orderItems: List<OrderItem>.from(json["order items"].map((x) => OrderItem.fromJson(x))),
        totalFee: List<TotalFee>.from(json["total fee"].map((x) => TotalFee.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "distance": distance,
        "pickup_from": pickupFrom,
        "pickup_address": pickupAddress,
        "pickup_time": pickupTime,
        "pickup_date": pickupDate,
        "deliver_to": deliverTo,
        "delivery_address": deliveryAddress,
        "deliver_time": deliverTime,
        "deliver_date": deliverDate,
        "total_earnings": totalEarnings,
        "status": status,
        "pickup_phone": pickupPhone,
        "deliver_phone": deliverPhone,
        "delivery_instraction": deliveryInstraction,
        "order items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "total fee": List<dynamic>.from(totalFee.map((x) => x.toJson())),
    };
}

class OrderItem {
    OrderItem({
        required this.itemCount,
        required this.itemName,
        required this.itemPrice,
    });

    String itemCount;
    String itemName;
    String itemPrice;

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        itemCount: json["item_count"],
        itemName: json["item_name"],
        itemPrice: json["item_price"],
    );

    Map<String, dynamic> toJson() => {
        "item_count": itemCount,
        "item_name": itemName,
        "item_price": itemPrice,
    };
}

class TotalFee {
    TotalFee({
        required this.tax,
        required this.deliveryFee,
        required this.deliveryTip,
        required this.discount,
        required this.totalPrice,
    });

    String tax;
    String deliveryFee;
    String deliveryTip;
    String discount;
    String totalPrice;

    factory TotalFee.fromJson(Map<String, dynamic> json) => TotalFee(
        tax: json["Tax"],
        deliveryFee: json["Delivery Fee"],
        deliveryTip: json["Delivery Tip"],
        discount: json["Discount"],
        totalPrice: json["total_price"],
    );

    Map<String, dynamic> toJson() => {
        "Tax": tax,
        "Delivery Fee": deliveryFee,
        "Delivery Tip": deliveryTip,
        "Discount": discount,
        "total_price": totalPrice,
    };
}
