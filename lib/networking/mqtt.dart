import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  final String host = '6535208d4a14400a9420663cfc862c9c.s1.eu.hivemq.cloud';

  final int wsPort = 8884;
  final int tlsPort = 8883;

  final String username = 'parry';
  final String password = 'Greenblue2007';

  final String topic = 'esp32/controller';

  late MqttClient client;

  Future<void> ring() async {
    final clientId = 'flutter_${DateTime.now().millisecondsSinceEpoch}';

    if (kIsWeb) {
      final browserClient = MqttBrowserClient(
        'wss://$host:$wsPort/mqtt',
        clientId,
      );

      browserClient.port = wsPort;

      browserClient.websocketProtocols = ['mqtt'];

      client = browserClient;
    } else {
      final serverClient = MqttServerClient(host, clientId);
      serverClient.port = tlsPort;
      serverClient.secure = true;
      client = serverClient;
    }

    client.setProtocolV311();

    client.keepAlivePeriod = 20;
    client.logging(on: true);

    client.connectionMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .startClean()
        .authenticateAs(username, password);

    try {
      await client.connect();
    } catch (e) {
      print('❌ MQTT connection error: $e');
      client.disconnect();
      return;
    }

    if (client.connectionStatus?.state != MqttConnectionState.connected) {
      print('❌ MQTT not connected');
      client.disconnect();
      return;
    }

    final builder = MqttClientPayloadBuilder();
    builder.addString('ALARM');

    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);

    print('📤 BUZZER_ON sent');

    await Future.delayed(const Duration(milliseconds: 300));
    client.disconnect();
  }
}