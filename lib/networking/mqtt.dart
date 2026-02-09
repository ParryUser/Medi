import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  final String broker = 'wss://6535208d4a14400a9420663cfc862c9c.s1.eu.hivemq.cloud:8884/mqtt';
  final int port = 8884;
  final String username = 'parry';
  final String password = 'Greenblue2007';
  final String clientId = 'flutterClient';

  late MqttServerClient client;

  Future<void> ring() async {
    await connect();

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('Connected to HiveMQ');
      
      publish("ALARM");
    } else {
      print('Connection failed - status: ${client.connectionStatus!.state}');
      client.disconnect();
    }
  }

  Future<void> connect() async {
    client = MqttServerClient(broker, clientId);
    client.port = port;
    client.secure = true;
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .startClean()
        .authenticateAs(username, password)
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;

    try {
      await client.connect();
      print('Connected to HiveMQ!');
    } catch (e) {
      print('Connection failed: $e');
      client.disconnect();
    }
  }

  void onDisconnected() {
    print('Disconnected from HiveMQ');
    connect();
  }

  void publish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(
      'esp32/controller',
      MqttQos.atLeastOnce,
      builder.payload!,
    );
    print('Published: $message');
  }

  void disconnect() {
    client.disconnect();
  }
}