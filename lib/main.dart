import 'package:flutter/material.dart';
import 'package:testapp/pages/home.dart';
import 'package:testapp/pages/launch.dart';
import 'package:testapp/pages/loading.dart';
import 'package:testapp/pages/setup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Launch(
      nextRoute: '/setup',
    ),
    routes: {
      '/setup': (context) => const SetupPage(),
      // '/loading': (context) => const LoadingPage(),
      // '/home': (context) => const Home(),
    },
  ));
}
