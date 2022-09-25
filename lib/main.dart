// @dart=2.9

import 'package:flutter/material.dart';
import 'package:testapp/pages/joypad.dart';
import 'package:testapp/pages/launch.dart';
import 'package:testapp/pages/setup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Launch(
      nextRoute: '/setup',
    ),
    routes: {
      '/setup': (context) => const SetupPage(),
    },
  ));
}
