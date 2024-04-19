import 'package:ably_flutter/ably_flutter.dart';
import 'package:dream_burger_sample_work/streams.dart';
import 'package:dream_burger_sample_work/utils/constant.dart';

class AblyService {
  static final AblyService _instance = AblyService._internal();

  factory AblyService() => _instance;

  late final Realtime realtimeInstance;
  late RealtimeChannel orderChannel;

  AblyService._internal() {
    createAblyRealtimeInstance();
  }

  void createAblyRealtimeInstance() async {
    var clientOptions = ClientOptions(
        key: "geRY-g.-HZJ3A:c4ETIkWqyvcogFVX_xBrrXFRHVP6_e4uoaa_N0z5pts");
    try {
      realtimeInstance = Realtime(options: clientOptions);
      orderChannel = realtimeInstance.channels.get(channelName);
      subscribeToChannel();
      realtimeInstance.connection
          .on(ConnectionEvent.connected)
          .listen((ConnectionStateChange stateChange) async {});
    } catch (error) {
      rethrow;
    }
  }

  void subscribeToChannel() {
    var orderStream = orderChannel.subscribe();
    orderStream.listen((Message message) {
      Streams.instance.messageController.add(message);
    });
  }

  void dispose() {
    Streams.instance.messageController.close();
    realtimeInstance.close();
  }
}
