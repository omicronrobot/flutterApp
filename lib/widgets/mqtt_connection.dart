import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:universal_mqtt_client/universal_mqtt_client.dart';

void sendMQTTData(String httpURL, double degrees, double distance) async {
  final client = UniversalMqttClient(
    broker: Uri.parse(httpURL),
    username: "cfc7a6c8-941e-4d72-be17-dbcc24b17fa3",
    password: "7686eb82-d6b5-4513-b559-d867c8ed85e3",
  );
  await client.connect();
  var body = jsonEncode([
    {"bn": "mobile", "n": "pitch", "u": "m/s", "v": distance},
    {"n": "yaw", "u": "rad", "v": degrees}
  ]);
  client.publishString('channels/fadfba2a-297c-49ef-87f3-c3b4745ce2ec/messages',
      body, MqttQos.exactlyOnce);
  client.disconnect();
}
