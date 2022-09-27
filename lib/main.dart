// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omicronapp/pages/launch.dart';
import 'package:omicronapp/pages/setup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown]);
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
