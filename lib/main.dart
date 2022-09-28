// @dart=2.9

import 'package:flutter/material.dart';
import 'pages/launch.dart';
import 'pages/setup.dart';

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
