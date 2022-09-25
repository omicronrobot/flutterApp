import 'package:flutter/material.dart';
import 'package:testapp/pages/home.dart';
import 'package:testapp/pages/launch.dart';
import 'package:testapp/pages/setup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Launch(
            nextRoute: '/setup',
          ),
      '/setup': (context) => const SetupPage(),
      '/home': (context) => const Home(),
    },
  ));
}
