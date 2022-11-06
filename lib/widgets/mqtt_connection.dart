import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:universal_mqtt_client/universal_mqtt_client.dart';

void sendMQTTData(String httpURL, String username, String password,
    String channel, double degrees, double distance) async {
  final client = UniversalMqttClient(
    broker: Uri.parse(httpURL),
    username: username,
    password: password,
  );
  await client.connect();
  var body = jsonEncode([
    {"bn": "mobile", "n": "pitch", "u": "m/s", "v": distance},
    {"n": "yaw", "u": "rad", "v": degrees}
  ]);
  client.publishString(channel, body, MqttQos.exactlyOnce);
  client.disconnect();
}
