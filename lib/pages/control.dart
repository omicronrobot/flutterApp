import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:control_pad/control_pad.dart';
import 'package:omicronapp/widgets/http_connection.dart';
import 'package:omicronapp/widgets/mqtt_connection.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:universal_mqtt_client/universal_mqtt_client.dart';

class JoypadPage extends StatefulWidget {
  final String endpoint;
  final String protocol;
  final UniversalMqttClient? mqttClient;
  final String? mqttUsername;
  final String? mqttPassword;
  final String? pubChannel;
  final String? httpAuth;

  const JoypadPage({
    Key? key,
    required this.endpoint,
    required this.protocol,
    this.mqttClient,
    this.mqttUsername,
    this.mqttPassword,
    this.pubChannel,
    this.httpAuth,
  }) : super(key: key);

  @override
  State<JoypadPage> createState() => _JoypadPageState();
}

class _JoypadPageState extends State<JoypadPage> {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Center(
        child: deviceOrientation == Orientation.portrait
            ? PortraitMode(
                endpoint: widget.endpoint,
                protocol: widget.protocol,
                mqttClient: widget.mqttClient,
                mqttUsername: widget.mqttUsername,
                mqttPassword: widget.mqttPassword,
                pubChannel: widget.pubChannel,
                httpAuth: widget.httpAuth,
              )
            : LandscapeMode(
                endpoint: widget.endpoint,
                protocol: widget.protocol,
                mqttClient: widget.mqttClient,
                mqttUsername: widget.mqttUsername,
                mqttPassword: widget.mqttPassword,
                pubChannel: widget.pubChannel,
                httpAuth: widget.httpAuth,
              ),
      ),
    );
  }
}

class PortraitMode extends StatelessWidget {
  final String endpoint;
  final String protocol;
  final UniversalMqttClient? mqttClient;
  final String? mqttUsername;
  final String? mqttPassword;
  final String? pubChannel;
  final String? httpAuth;

  const PortraitMode({
    Key? key,
    required this.endpoint,
    required this.protocol,
    required this.mqttClient,
    this.mqttUsername,
    this.mqttPassword,
    this.pubChannel,
    this.httpAuth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff152238),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Center(
              child: Container(
                width: width,
                height: height,
                margin: const EdgeInsets.fromLTRB(20, 100, 20, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.orange[600],
                              shape: const StadiumBorder(),
                              // padding: const EdgeInsets.all(15),
                              fixedSize: const Size(120, 40),
                              elevation: 15,
                              shadowColor: Colors.orange[600],
                            ),
                            icon: const Icon(Icons.start_rounded),
                            label: const Text('Start'),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.orange[600],
                              shape: const StadiumBorder(),
                              fixedSize: const Size(120, 40),
                              elevation: 15,
                              shadowColor: Colors.orange[600],
                            ),
                            icon: const Icon(Icons.stop_circle_outlined),
                            label: const Text('Stop'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange[600],
                        shape: const StadiumBorder(),
                        // padding: const EdgeInsets.all(15),
                        fixedSize: const Size(120, 40),
                        elevation: 15,
                        shadowColor: Colors.orange[600],
                      ),
                      icon: const Icon(Icons.replay_10_rounded),
                      label: const Text('Replay'),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    JoystickView(
                      backgroundColor: Colors.orange[600],
                      iconsColor: Colors.black,
                      innerCircleColor: Colors.black,
                      showArrows: false,
                      interval: const Duration(seconds: 1),
                      onDirectionChanged: (degrees, distance) {
                        if (protocol == "http") {
                          sendHTTPData(endpoint, httpAuth!, degrees, distance);
                        }
                        if (protocol == "mqtt") {
                          sendMQTTData(endpoint, mqttUsername!, mqttPassword!,
                              pubChannel!, degrees, distance);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {},
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LandscapeMode extends StatelessWidget {
  final String endpoint;
  final String protocol;
  final UniversalMqttClient? mqttClient;
  final String? mqttUsername;
  final String? mqttPassword;
  final String? pubChannel;
  final String? httpAuth;

  const LandscapeMode({
    Key? key,
    required this.endpoint,
    required this.protocol,
    required this.mqttClient,
    this.mqttUsername,
    this.mqttPassword,
    this.pubChannel,
    this.httpAuth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 130, 4, 4),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Center(
              child: Container(
                width: width,
                height: height,
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.orange[600],
                                shape: const StadiumBorder(),
                                fixedSize: const Size(120, 40),
                                elevation: 15,
                                shadowColor: Colors.orange[600],
                              ),
                              icon: const Icon(Icons.start_rounded),
                              label: const Text('Start'),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.orange[600],
                                shape: const StadiumBorder(),
                                fixedSize: const Size(120, 40),
                                elevation: 15,
                                shadowColor: Colors.orange[600],
                              ),
                              icon: const Icon(Icons.stop_circle_outlined),
                              label: const Text('Stop'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange[600],
                            shape: const StadiumBorder(),
                            fixedSize: const Size(120, 40),
                            elevation: 15,
                            shadowColor: Colors.orange[600],
                          ),
                          icon: const Icon(Icons.replay_10_rounded),
                          label: const Text('Replay'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    JoystickView(
                      backgroundColor: Colors.orange[600],
                      iconsColor: Colors.black,
                      innerCircleColor: Colors.black,
                      showArrows: false,
                      onDirectionChanged: (degrees, distance) {
                        if (protocol == "http") {
                          sendHTTPData(endpoint, httpAuth!, degrees, distance);
                        }
                        if (protocol == "mqtt") {
                          sendMQTTData(endpoint, mqttUsername!, mqttPassword!,
                              pubChannel!, degrees, distance);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {},
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
