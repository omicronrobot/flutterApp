import 'package:flutter/material.dart';
import 'package:testapp/pages/home.dart';
import 'package:testapp/pages/launch.dart';
import 'package:testapp/pages/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
      '/': (context) => const Launch(
            nextRoute: '/loading',
          ),
      '/loading': (context) => const Loading(),
      '/home': (context) => const Home(),
    },
    )
  );
}

