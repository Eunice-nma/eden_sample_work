import 'package:dream_burger_sample_work/utils/constant.dart';

class Order {
  final String id;
  OrderStatus status;
  DateTime date;
  OrderItem item;

  Order(
      {required this.id,
      required this.status,
      required this.date,
      required this.item});
}

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
}
