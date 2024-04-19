import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import '../../../streams.dart';
import '../../../utils/constant.dart';
import '../model/order.dart';

class OrderViewModel extends ChangeNotifier {
  late StreamSubscription _messageSubscription;

  OrderViewModel() {
    _messageSubscription =
        Streams.instance.messageController.stream.listen((message) {
      _aciveIndex = int.parse(message.data.toString());
      dummyOrder.status = OrderStatus.values[_aciveIndex];
      notifyListeners();
    });
  }

  Order dummyOrder = Order(
    id: '12344',
    status: OrderStatus.placed,
    date: DateTime.now(),
    item: OrderItem(name: 'Big Burger', quantity: 2, price: 2800),
  );
  String get currentStatus => readableStatus[dummyOrder.status]!;
  String get currentStatusDescription =>
      detailedStatusDescriptions[dummyOrder.status]!;

  final DateFormat formatter = DateFormat('EEE, MMM d, yyyy');

  int _aciveIndex = 1;
  int get stepperIndex => _aciveIndex - 1;

  @override
  void dispose() {
    _messageSubscription.cancel();
    super.dispose();
  }

  Map<OrderStatus, String> readableStatus = {
    OrderStatus.placed: "Your order has been placed.",
    OrderStatus.accepted: "Your order has been accepted.",
    OrderStatus.pickupInProgress: "Your order is awaiting pickup.",
    OrderStatus.onTheWay: "Your order is on the way.",
    OrderStatus.arrived: "Your order is here.",
    OrderStatus.delivered: "Your order has been delivered.",
  };

  Map<OrderStatus, String> detailedStatusDescriptions = {
    OrderStatus.placed: "waiting for vendor to accept your order.",
    OrderStatus.accepted:
        "The vendor is preparing your order and a rider will pick up soon.",
    OrderStatus.pickupInProgress:
        "A rider is on the way to pick up your order.",
    OrderStatus.onTheWay: "Hang tight, your order is on the way.",
    OrderStatus.arrived: "Please don't keep the rider waiting.",
    OrderStatus.delivered: "We hope you enjoy your meal!",
  };
}
