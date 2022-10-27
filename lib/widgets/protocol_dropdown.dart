import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:universal_mqtt_client/universal_mqtt_client.dart';
import 'package:validators/validators.dart';

import '../pages/control.dart';

const List<String> protocolList = <String>['http', 'mqtt', 'websocket'];

class SetupForm extends StatefulWidget {
  const SetupForm({super.key});

  @override
  State<SetupForm> createState() => _SetupFormState();
}

class _SetupFormState extends State<SetupForm> {
  late String _protocol;
  late String _endpoint;
  final formKey = GlobalKey<FormState>(); //key for form

  @override
  void initState() {
    super.initState();
    _protocol = '';
    _endpoint = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey, //key for form
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.name,
              maxLength: 10,
              style: TextStyle(
                fontFamily: 'FredokaOne',
                fontSize: 15,
                color: Colors.orange[700],
              ),
              decoration: const InputDecoration(
                labelText: 'Enter Protocol',
                hintText: 'mqtt',
                labelStyle: TextStyle(),
                hintStyle: TextStyle(),
              ),
              textAlign: TextAlign.start,
              onChanged: (value) {
                _protocol = value;
              },
              validator: (value) {
                if (value!.isEmpty ||
                    value.length < 10 ||
                    contains(value, "mqtt") ||
                    contains(value, "http") ||
                    contains(value, "websocket")) {
                  return null;
                } else {
                  return "Enter Endpoint Protocol";
                }
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
                labelText: 'Enter Endpoint',
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
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    UniversalMqttClient? mclient;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return JoypadPage(
                        endpoint: _endpoint,
                        protocol: _protocol,
                        mqttClient: mclient,
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
    );
  }
}

class ProtocolDropDownList extends StatefulWidget {
  const ProtocolDropDownList({super.key});

  @override
  State<ProtocolDropDownList> createState() => _ProtocolDropDownListState();
}

class _ProtocolDropDownListState extends State<ProtocolDropDownList> {
  String dropdownValue = protocolList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      alignment: AlignmentDirectional.topStart,
      borderRadius: BorderRadius.circular(2.0),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: protocolList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
