import 'dart:async';

import 'package:ably_flutter/ably_flutter.dart';

class Streams {
  Streams._privateConstructor();

  static final Streams _instance = Streams._privateConstructor();
  static Streams get instance => _instance;

  final StreamController<Message> _messageController =
      StreamController<Message>.broadcast();

  StreamController<Message> get messageController => _messageController;
}
