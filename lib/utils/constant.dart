import 'package:intl/intl.dart';

enum OrderStatus {
  placed,
  accepted,
  pickupInProgress,
  onTheWay,
  arrived,
  delivered,
}

extension OrderStatusExtension on OrderStatus {
  String get nameForDisplay {
    String camelCaseText = name;
    String spacedText = camelCaseText.replaceAllMapped(
        RegExp(r'(?<=[a-z])([A-Z])'), (Match m) => ' ${m[1]}');
    return spacedText
        .split(' ')
        .map((str) => str[0].toUpperCase() + str.substring(1))
        .join(' ');
  }
}

String formatPrice(double price) {
  var formatter = NumberFormat.currency(locale: 'en_US', symbol: '');
  return formatter.format(price);
}

String getFirstName(String name) {
  name = name.trim();
  final firstName = name.split(' ');
  return firstName[0];
}

const String channelName = 'burger';

const String ablyKey =
    "geRY-g.-HZJ3A:c4ETIkWqyvcogFVX_xBrrXFRHVP6_e4uoaa_N0z5pts";
