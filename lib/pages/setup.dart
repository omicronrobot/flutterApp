import 'package:flutter/material.dart';
import 'package:omicronapp/pages/control.dart';
import 'package:omicronapp/widgets/quide.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:universal_mqtt_client/universal_mqtt_client.dart';
import 'package:validators/validators.dart';

import '../widgets/curved_painter.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final formKey = GlobalKey<FormState>();
  late String _protocol;
  late String _endpoint;
  late String _mqttUsername;
  late String _mqttPassword;
  late String _pubChannel;
  late String _httpAuth;

  @override
  void initState() {
    super.initState();
    _protocol = 'http';
    _endpoint = 'http://localhost';
    _mqttUsername = "";
    _mqttPassword = "";
    _pubChannel = "";
    _httpAuth = "";
  }

  @override
  void dispose() {
    super.dispose();
  }

  var protocolItems = [
    'http',
    'mqtt',
    'websocket',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Center(
                child: CustomPaint(
              // TODO Return to 0.4
              size: Size(width, height * 0.3),
              painter: CurvedPainter(),
            )),
            // const SizedBox(
            //   height: 2,
            // ),
            Text(
              'Welcome to Omicron',
              style: TextStyle(
                fontFamily: 'FredokaOne',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: formKey, //key for form
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButtonFormField(
                          value: _protocol,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: protocolItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _protocol = newValue.toString();
                            });
                          },
                          style: TextStyle(
                            fontFamily: 'FredokaOne',
                            fontSize: 15,
                            color: Colors.orange[700],
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Enter Protocol',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.url,
                          style: TextStyle(
                            fontFamily: 'FredokaOne',
                            fontSize: 15,
                            color: Colors.orange[700],
                          ),
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: 'Enter URI Endpoint',
                            hintText: 'http://omicron.rodneyosodo.com/api',
                            labelStyle: TextStyle(),
                            hintStyle: TextStyle(),
                          ),
                          onChanged: (value) {
                            _endpoint = value;
                          },
                          validator: (value) {
                            if (_protocol == "http") {
                              if (isURL(value)) {
                                return null;
                              } else {
                                return "Enter Endpoint URI";
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.url,
                          style: TextStyle(
                            fontFamily: 'FredokaOne',
                            fontSize: 15,
                            color: Colors.orange[700],
                          ),
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: 'Enter MQTT Username',
                            hintText: 'cfc7a6c8-941e-4d72-be17-dbcc24b17fa3',
                            labelStyle: TextStyle(),
                            hintStyle: TextStyle(),
                          ),
                          onChanged: (value) {
                            _mqttUsername = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.url,
                          style: TextStyle(
                            fontFamily: 'FredokaOne',
                            fontSize: 15,
                            color: Colors.orange[700],
                          ),
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: 'Enter MQTT Password',
                            hintText: '7686eb82-d6b5-4513-b559-d867c8ed85e3',
                            labelStyle: TextStyle(),
                            hintStyle: TextStyle(),
                          ),
                          onChanged: (value) {
                            _mqttPassword = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.url,
                          style: TextStyle(
                            fontFamily: 'FredokaOne',
                            fontSize: 15,
                            color: Colors.orange[700],
                          ),
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: 'Enter Publisher Channel',
                            hintText:
                                'channels/fadfba2a-297c-49ef-87f3-c3b4745ce2ec/messages',
                            labelStyle: TextStyle(),
                            hintStyle: TextStyle(),
                          ),
                          onChanged: (value) {
                            _pubChannel = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.url,
                          style: TextStyle(
                            fontFamily: 'FredokaOne',
                            fontSize: 15,
                            color: Colors.orange[700],
                          ),
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: 'Enter HTTP Auth',
                            hintText: 'Thing 7686eb82-d6b5-4513-b559-d867c8ed85e3',
                            labelStyle: TextStyle(),
                            hintStyle: TextStyle(),
                          ),
                          onChanged: (value) {
                            _httpAuth = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:35,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                UniversalMqttClient? mclient;
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return JoypadPage(
                                    endpoint: _endpoint,
                                    protocol: _protocol,
                                    mqttClient: mclient,
                                    mqttUsername: _mqttUsername,
                                    mqttPassword: _mqttPassword,
                                    pubChannel: _pubChannel,
                                    httpAuth: _httpAuth,
                                  );
                                }));
                              }
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              backgroundColor: Colors.orange[700],
                            ),
                            child: const Text(
                              "Setup",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: TextButton(
                style: const ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const Guide();
                  }));
                },
                child: Text(
                  'Guide?',
                  style: TextStyle(
                    color: Colors.orange[700],
                  ),
                ),
              ),
            ),
            // const TermsOfUse(),
          ],
        ),
      ),
    );
  }
}
