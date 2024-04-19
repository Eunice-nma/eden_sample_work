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

const String channelName = 'burger';
