import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import '../../../utils/streams.dart';
import '../../../utils/constant.dart';
import '../model/order.dart';

class OrderViewModel extends ChangeNotifier {
  late StreamSubscription _messageSubscription;

  OrderViewModel() {
    _messageSubscription =
        Streams.instance.messageController.stream.listen((message) {
      try {
        int index = int.parse(message.data.toString());
        if (index <= OrderStatus.values.length - 1) {
          _currentIndex = index;
          dummyOrder.status = OrderStatus.values[_currentIndex!];
          notifyListeners();
        }
      } catch (e) {
        log("Error parsing index from message: ${message.data}. Error: $e");
      }
    });
  }

  String get currentStatus => readableStatus[dummyOrder.status]!;
  String get currentStatusDescription =>
      detailedStatusDescriptions[dummyOrder.status]!;

  final DateFormat formatter = DateFormat('EEE, MMM d, yyyy');

  int? _currentIndex;
  int get stepperIndex => _currentIndex ?? 0;

  Order dummyOrder = Order(
    id: '12344',
    status: OrderStatus.placed,
    date: DateTime.now(),
    item: OrderItem(name: 'Big Burger', quantity: 2, price: 2800),
  );

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

  @override
  void dispose() {
    _messageSubscription.cancel();
    super.dispose();
  }
}
